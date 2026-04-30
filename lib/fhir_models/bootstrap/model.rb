require 'nokogiri'
require 'mime/types'
require 'yaml'
require 'bcp47'
require_relative '../r4/bootstrap/definitions'

module FHIR
  class Model
    extend FHIR::Deprecate
    def initialize(hash = {})
      from_hash(hash)
      self.class::METADATA.each do |key, value|
        local_name = key
        local_name = value['local_name'] if value['local_name']
        if value['max'] > 1 && instance_variable_get("@#{local_name}").nil?
          instance_variable_set("@#{local_name}".to_sym, [])
        end
      end
    end

    # This is necessary for uniq to properly identify two FHIR models as being identical
    def hash
      to_hash.hash
    end

    def respond_to_missing?(method_name, *)
      (defined?(self.class::MULTIPLE_TYPES) && self.class::MULTIPLE_TYPES[method_name.to_s]) ||
        (!@extension.nil? && !@extension.empty? && !find_extension(@extension, method_name).first.nil?) ||
        (!@modifierExtension.nil? && !@modifierExtension.empty? && !find_extension(@modifierExtension, method_name).first.nil?) ||
        super
    end

    # allow two FHIR models to be compared for equality
    def ==(other)
      self.class == other.class && to_hash == other.to_hash
    end
    alias eql? ==

    def method_missing(method_name, *_args, &_block)
      if defined?(self.class::MULTIPLE_TYPES) && self.class::MULTIPLE_TYPES[method_name.to_s]
        self.class::MULTIPLE_TYPES[method_name.to_s].each do |type|
          type[0] = type[0].upcase
          value = send("#{method_name}#{type}".to_sym)
          return value unless value.nil?
        end
        return nil
      elsif !@extension.nil? && !@extension.empty?
        desired_extension = find_extension(@extension, method_name)
        unless desired_extension.first.nil?
          return desired_extension.first.value.nil? ? desired_extension.first : desired_extension.first.value
        end
      elsif !@modifierExtension.nil? && !@modifierExtension.empty?
        desired_extension = find_extension(@modifierExtension, method_name)
        unless desired_extension.first.nil?
          return desired_extension.first.value.nil? ? desired_extension.first : desired_extension.first.value
        end
      end
      raise NoMethodError.new("undefined method `#{method_name}' for #{self.class.name}", method_name)
    end

    def to_reference
      versioned_fhir_module::Reference.new(reference: "#{self.class.name.split('::').last}/#{id}")
    end

    def equals?(other, exclude = [])
      (self.class::METADATA.keys - exclude).each do |attribute|
        return false unless compare_attribute(instance_variable_get("@#{attribute}".to_sym), other.instance_variable_get("@#{attribute}".to_sym), exclude)
      end
      true
    end

    def mismatch(other, exclude = [])
      misses = []
      (self.class::METADATA.keys - exclude).each do |key|
        these = attribute_mismatch(instance_variable_get("@#{key}".to_sym), other.instance_variable_get("@#{key}".to_sym), exclude)
        if !these || (these.is_a?(Array) && !these.empty?)
          misses << "#{self.class}::#{key}"
          misses.concat these if these.is_a?(Array)
        end
      end
      misses
    end

    def attribute_mismatch(left, right, exclude = [])
      if left.respond_to?(:mismatch) && right.respond_to?(:mismatch)
        left.mismatch right, exclude
      else
        compare_attribute(left, right, exclude)
      end
    end

    def compare_attribute(left, right, exclude = [])
      if left.respond_to?(:equals?) && right.respond_to?(:equals?)
        left.equals? right, exclude
      elsif left.is_a?(Array) && right.is_a?(Array) && (left.length == right.length)
        result = true
        (0...(left.length)).each { |i| result &&= compare_attribute(left[i], right[i], exclude) }
        result
      else
        left == right
      end
    end

    def valid?
      validate.empty?
    end
    deprecate :is_valid?, :valid?

    def validate(contained = nil)
      validate_profile(self.class::METADATA, contained)
    end

    def validate_profile(metadata, contained = nil)
      contained_here = [instance_variable_get('@contained'.to_sym)].flatten
      contained_here << contained
      contained_here = contained_here.flatten.compact
      errors = {}
      metadata.each do |field, meta|
        if meta.is_a?(Array)
          # this field has been 'sliced'
          meta.each do |slice|
            local_name = slice['local_name'] || field
            value = [instance_variable_get("@#{local_name}".to_sym)].flatten.compact
            subset = [] # subset is the values associated with just this slice
            if slice['type'] == 'Extension'
              subset = if slice['type_profiles']
                         value.select { |x| slice['type_profiles'].include?(x.url) }
                       else
                         value
                       end
            else
              FHIR.logger.warn 'Validation not supported on slices (except for Extensions)'
            end
            validate_field(field, subset, contained_here, slice, errors)
          end
        else
          local_name = meta['local_name'] || field
          value = [instance_variable_get("@#{local_name}".to_sym)].flatten.compact
          validate_field(field, value, contained_here, meta, errors)
        end
      end # metadata.each
      # check multiple types
      multiple_types = begin
        self.class::MULTIPLE_TYPES
      rescue StandardError
        {}
      end
      multiple_types.each do |prefix, suffixes|
        present = []
        suffixes.each do |suffix|
          typename = "#{prefix}#{suffix[0].upcase}#{suffix[1..]}"
          # check which multiple data types are actually present, not just errors
          # actually, this might be allowed depending on cardinality
          value = instance_variable_get("@#{typename}")
          present << typename if !value.nil? || (value.is_a?(Array) && !value.empty?)
        end
        errors[prefix] = ["#{prefix}[x]: more than one type present."] if present.length > 1
        # remove errors for suffixes that are not present
        next unless present.length == 1

        suffixes.each do |suffix|
          typename = "#{prefix}#{suffix[0].upcase}#{suffix[1..]}"
          errors.delete(typename) unless present.include?(typename)
        end
      end
      errors.keep_if { |_k, v| v && !v.empty? }
    end

    # ----- validate a field -----
    # field: the field name
    # value: an array of values for this field
    # contained_here: all contained resources to be considered
    # meta: the metadata definition for this field (or slice)
    # errors: the ongoing list of errors
    def validate_field(field, value, contained_here, meta, errors)
      errors[field] = []
      # check cardinality
      count = value.length
      unless count >= meta['min'] && count <= meta['max']
        errors[field] << "#{meta['path']}: invalid cardinality. Found #{count} expected #{meta['min']}..#{meta['max']}"
      end
      # check datatype
      datatype = meta['type']
      value.each do |v|
        klassname = v.class.name.gsub("#{versioned_fhir_module.name}::", '')
        # if the data type is a generic Resource, validate it
        if datatype == 'Resource'
          if versioned_fhir_module::RESOURCES.include?(klassname)
            validation = v.validate(contained_here)
            errors[field] << validation unless validation.empty?
          else
            errors[field] << "#{meta['path']}: expected Resource, found #{klassname}"
          end
        # if the data type is a Reference, validate it, but also check the
        # type_profiles metadata. For example, if it should be a Reference(Patient)
        elsif datatype == 'Reference'
          if klassname == 'Reference'
            validation = v.validate(contained_here)
            errors[field] << validation unless validation.empty?
            validate_reference_type(v, meta, contained_here, errors[field])
          else
            errors[field] << "#{meta['path']}: expected Reference, found #{klassname}"
          end
        # if the data type is a particular resource or complex type or BackBone element within this resource
        elsif versioned_fhir_module::RESOURCES.include?(datatype) || versioned_fhir_module::TYPES.include?(datatype) || v.class.name.start_with?(self.class.name)
          if datatype == klassname
            validation = v.validate(contained_here)
            errors[field] << validation unless validation.empty?
          else
            errors[field] << "#{meta['path']}: incorrect type. Found #{klassname} expected #{datatype}"
          end
        # if the data type is a primitive, test the regular expression (if any)
        elsif versioned_fhir_module::PRIMITIVES.include?(datatype)
          primitive_meta = versioned_fhir_module::PRIMITIVES[datatype]
          if primitive_meta['regex'] && primitive_meta['type'] != 'number'
            match = (v.to_s =~ Regexp.new(primitive_meta['regex']))
            errors[field] << "#{meta['path']}: #{v} does not match #{datatype} regex" if match.nil?
          else
            errors[field] << "#{meta['path']}: #{v} is not a valid #{datatype}" unless FHIR.primitive?(datatype: datatype, value: v)
          end
        end
        # check binding
        next unless meta['binding']
        next unless meta['binding']['strength'] == 'required'

        the_codes = [v]
        case meta['type']
        when 'Coding'
          the_codes = [v.code]
        when 'CodeableConcept'
          the_codes = v.coding.map(&:code).compact
        end
        has_valid_code = false
        if meta['valid_codes']
          meta['valid_codes'].each_value do |codes|
            has_valid_code = true unless (codes & the_codes).empty?
            break if has_valid_code
          end
        else
          the_codes.each do |code|
            has_valid_code = true if check_binding_uri(meta['binding']['uri'], code)
            break if has_valid_code
          end
        end
        errors[field] << "#{meta['path']}: invalid codes #{the_codes}" unless has_valid_code
      end # value.each
      errors.delete(field) if errors[field].empty?
    end

    def validate_reference_type(ref, meta, contained_here, errors)
      return unless ref.reference && meta['type_profiles']
      return if ref.reference.start_with?('urn:uuid:', 'urn:oid:')

      matches_one_profile = false
      meta['type_profiles'].each do |p|
        basetype = p.split('/').last
        matches_one_profile = true if ref.reference.include?(basetype)
        break if matches_one_profile

        # check profiled resources
        profile_basetype = versioned_fhir_module::Definitions.basetype(p)
        matches_one_profile = true if profile_basetype && ref.reference.include?(profile_basetype)
        break if matches_one_profile
      end
      matches_one_profile = true if meta['type_profiles'].include?('http://hl7.org/fhir/StructureDefinition/Resource')
      if !matches_one_profile && ref.reference.start_with?('#')
        # we need to look at the local contained resources
        r = contained_here.find { |x| x.id == ref.reference[1..] }
        if !r.nil?
          meta['type_profiles'].each do |p|
            p = p.split('/').last
            matches_one_profile = true if r.resourceType == p
          end
        else
          FHIR.logger.warn "Unable to resolve reference #{ref.reference}"
        end
      end
      errors << "#{meta['path']}: incorrect Reference type, expected #{meta['type_profiles'].map { |x| x.split('/').last }.join('|')}" unless matches_one_profile
    end

    def primitive?(datatype, value)
      FHIR.logger.warn("prefer using FHIR.primitive? Called from #{caller.first}")
      FHIR.primitive?(datatype: datatype, value: value)
    end
    deprecate :is_primitive?, :primitive?

    def check_binding_uri(uri, value)
      valid = false
      # Strip off the |4.0.0 or |4.0.1 or |2014-03-26 or similar from the ends of URLs
      uri&.gsub!(/\|[A-Za-z0-9.-]*/, '')
      valueset = versioned_fhir_module::Definitions.get_codes(uri)

      if ['http://hl7.org/fhir/ValueSet/mimetypes', 'http://www.rfc-editor.org/bcp/bcp13.txt'].include?(uri)
        matches = MIME::Types[value]
        json_or_xml = value.downcase.include?('xml') || value.downcase.include?('json')
        known_weird = ['text/cql', 'application/cql+text', 'application/hl7-v2'].include?(value)
        valid = json_or_xml || known_weird || (!matches.nil? && !matches.empty?)
      elsif ['http://hl7.org/fhir/ValueSet/languages', 'http://tools.ietf.org/html/bcp47'].include?(uri)
        has_region = !(value =~ /-/).nil?
        valid = !BCP47::Language.identify(value.downcase).nil? && (!has_region || !BCP47::Region.identify(value.upcase).nil?)
      elsif valueset.nil?
        FHIR.logger.warn "Unable to check_binding_uri on unknown ValueSet: #{uri}"
      else
        valid = valueset.values.flatten.include?(value)
      end

      valid
    end

    def each_element(path = nil, &block)
      self.class::METADATA.each do |element_name, metadata|
        local_name = metadata.fetch :local_name, element_name
        values = [instance_variable_get("@#{local_name}")].flatten.compact
        next if values.empty?

        values.each_with_index do |value, i|
          child_path =
            if path.nil?
              element_name
            else
              "#{path}.#{element_name}"
            end
          child_path += "[#{i}]" if metadata['max'] > 1
          yield value, metadata, child_path
          value.each_element child_path, &block unless versioned_fhir_module::PRIMITIVES.include? metadata['type']
        end
      end
      self
    end

    def find_extension(extension_source, method_name)
      extension_source.select do |extension|
        name = extension.url.tr('-', '_').split('/').last
        anchor = name.split('#').last
        [name, anchor].include?(method_name.to_s)
      end
    end

    private :validate_reference_type, :check_binding_uri, :validate_field, :find_extension
  end
end
