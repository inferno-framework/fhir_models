require 'nokogiri'
require 'logger'
require 'uri'

module FHIR
  module ClassMethods
    def from_contents(contents)
      doc = Nokogiri::XML(contents)
      if doc.errors.empty?
        versioned_fhir_module::Xml.from_xml(contents)
      else
        versioned_fhir_module::Json.from_json(contents)
      end
    end
  end
  include ClassMethods
  extend ClassMethods

  def self.logger
    @logger || default_logger
  end

  def self.logger=(logger)
    @logger = logger
  end

  def self.default_logger
    @default_logger ||= Logger.new(ENV['FHIR_LOGGER'] || $stdout)
  end

  # TODO: pull regexes from metadata
  def self.primitive?(datatype:, value:)
    # Remaining data types: handle special cases before checking type StructureDefinitions
    case datatype.downcase
    when 'boolean'
      !(value.to_s =~ /\A(true|false)\Z/).nil?
    when 'integer', 'integer64'
      !(value.to_s =~ /\A(0|[-+]?[1-9][0-9]*)\Z/).nil?
    when 'string', 'markdown'
      value.is_a?(String)
    when 'decimal'
      !(value.to_s =~ /\A([-+]?(0|[1-9][0-9]*)(\.[0-9]+)?([eE][+-]?[0-9]+)?)\Z/).nil?
    when 'uri'
      begin
        !URI.parse(value).nil?
      rescue StandardError
        false
      end
    when 'base64binary'
      # According to RFC-4648 base64binary encoding includes digits 0-9, a-z, A-Z, =, +, /, and whitespace
      # an empty string is considered valid
      # whitespace is not significant so we strip it out before doing the regex so that we can be sure that
      # the number of characters is a multiple of 4.
      # https://tools.ietf.org/html/rfc4648
      !(value.to_s.gsub(/\s/, '') =~ %r{\A(|[0-9a-zA-Z+=/]{4}+)\Z}).nil?
    when 'instant'
      formatted_value = value.respond_to?(:xmlschema) ? value.xmlschema : value.to_s
      !(formatted_value =~ /\A([0-9]{4}(-(0[1-9]|1[0-2])(-(0[0-9]|[1-2][0-9]|3[0-1])(T([01][0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9](\.[0-9]+)?(Z|(\+|-)((0[0-9]|1[0-3]):[0-5][0-9]|14:00))))))\Z/).nil?
    when 'date'
      !(value.to_s =~ /\A(-?[0-9]{4}(-(0[1-9]|1[0-2])(-(0[0-9]|[1-2][0-9]|3[0-1]))?)?)\Z/).nil?
      # NOTE: we don't try to instantiate and verify  a Date because ruby does not natively suppport
      # partial dates, which the FHIR standard allows.
    when 'datetime'
      !(value.to_s =~ /\A(-?[0-9]{4}(-(0[1-9]|1[0-2])(-(0[0-9]|[1-2][0-9]|3[0-1])(T([01][0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9](\.[0-9]+)?(Z|(\+|-)((0[0-9]|1[0-3]):[0-5][0-9]|14:00)))?)?)?)\Z/).nil?
      # NOTE: we don't try to instantiate and verify a DateTime because ruby does not natively suppport
      # partial dates, which the FHIR standard allows.
    when 'time'
      !(value.to_s =~ /\A(([01][0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9](\.[0-9]+)?)\Z/).nil?
    when 'code'
      !(value.to_s =~ /\A[^\s]+(\s?[^\s]+)*\Z/).nil?
    when 'oid'
      !(value.to_s =~ /\Aurn:oid:[0-2](\.[1-9]\d*)+\Z/).nil?
    when 'id'
      !(value.to_s =~ /\A[A-Za-z0-9\-.]{1,64}\Z/).nil?
    when 'xhtml'
      fragment = Nokogiri::HTML::DocumentFragment.parse(value)
      value.is_a?(String) && fragment.errors.empty?
    when 'unsignedint'
      !(value.to_s =~ /\A(0|([1-9][0-9]*))\Z/).nil?
    when 'positiveint'
      !(value.to_s =~ /\A+?[1-9][0-9]*\Z/).nil?
    when 'canonical', 'url'
      !(value.to_s =~ /\S*/).nil?
    when 'uuid'
      !(value.to_s =~ /urn:uuid:[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/).nil?
    else
      FHIR.logger.warn "Unable to check #{value} for datatype #{datatype}"
      false
    end
  end

  # These are needed for the unit tests that call FHIR directly
  def self.fhir_version_string
    'R4'
  end

  def self.versioned_fhir_module
    FHIR::R4
  end
end
