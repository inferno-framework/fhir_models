module FHIR
  module build.fhir.org
    class Availability < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = []
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Availability.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Availability.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'period' => {'type'=>'Period', 'path'=>'Availability.period', 'min'=>0, 'max'=>1},
        'availableTime' => {'type'=>'Availability::AvailableTime', 'path'=>'Availability.availableTime', 'min'=>0, 'max'=>Float::INFINITY},
        'notAvailableTime' => {'type'=>'Availability::NotAvailableTime', 'path'=>'Availability.notAvailableTime', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class AvailableTime < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'AvailableTime.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'AvailableTime.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'daysOfWeek' => {'valid_codes'=>{'http://hl7.org/fhir/days-of-week'=>['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun']}, 'type'=>'code', 'path'=>'AvailableTime.daysOfWeek', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/days-of-week'}},
          'allDay' => {'type'=>'boolean', 'path'=>'AvailableTime.allDay', 'min'=>0, 'max'=>1},
          'availableStartTime' => {'type'=>'time', 'path'=>'AvailableTime.availableStartTime', 'min'=>0, 'max'=>1},
          'availableEndTime' => {'type'=>'time', 'path'=>'AvailableTime.availableEndTime', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                 # 0-1 string
        attr_accessor :extension          # 0-* [ Extension ]
        attr_accessor :daysOfWeek         # 0-* [ code ]
        attr_accessor :allDay             # 0-1 boolean
        attr_accessor :availableStartTime # 0-1 time
        attr_accessor :availableEndTime   # 0-1 time
      end

      class NotAvailableTime < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'NotAvailableTime.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'NotAvailableTime.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'description' => {'type'=>'string', 'path'=>'NotAvailableTime.description', 'min'=>0, 'max'=>1},
          'during' => {'type'=>'Period', 'path'=>'NotAvailableTime.during', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id          # 0-1 string
        attr_accessor :extension   # 0-* [ Extension ]
        attr_accessor :description # 0-1 string
        attr_accessor :during      # 0-1 Period
      end

      attr_accessor :id               # 0-1 string
      attr_accessor :extension        # 0-* [ Extension ]
      attr_accessor :period           # 0-1 Period
      attr_accessor :availableTime    # 0-* [ Availability::AvailableTime ]
      attr_accessor :notAvailableTime # 0-* [ Availability::NotAvailableTime ]
    end
  end
end