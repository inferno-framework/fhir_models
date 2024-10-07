module FHIR
  module R6
    class Goal < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'start' => ['date', 'CodeableConcept']
      }
      SEARCH_PARAMS = ['achievement-status', 'addresses', 'category', 'description', 'identifier', 'lifecycle-status', 'patient', 'start-date', 'subject', 'target-date', 'target-measure']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Goal.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'Goal.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'Goal.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'Goal.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'Goal.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'Goal.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'Goal.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Goal.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'Goal.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'lifecycleStatus' => {'valid_codes'=>{'http://hl7.org/fhir/goal-status'=>['proposed', 'planned', 'accepted', 'active', 'on-hold', 'completed', 'cancelled', 'entered-in-error', 'rejected']}, 'type'=>'code', 'path'=>'Goal.lifecycleStatus', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/goal-status'}},
        'achievementStatus' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/goal-achievement'=>['in-progress', 'improving', 'worsening', 'no-change', 'achieved', 'sustaining', 'not-achieved', 'no-progress', 'not-attainable']}, 'type'=>'CodeableConcept', 'path'=>'Goal.achievementStatus', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/goal-achievement'}},
        'category' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/goal-category'=>['dietary', 'safety', 'behavioral', 'nursing', 'physiotherapy']}, 'type'=>'CodeableConcept', 'path'=>'Goal.category', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/goal-category'}},
        'continuous' => {'type'=>'boolean', 'path'=>'Goal.continuous', 'min'=>0, 'max'=>1},
        'priority' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/goal-priority'=>['high-priority', 'medium-priority', 'low-priority']}, 'type'=>'CodeableConcept', 'path'=>'Goal.priority', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/goal-priority'}},
        'description' => {'valid_codes'=>{'http://snomed.info/sct'=>['2004005', '301475006', '282192007', '161922009', '228367002', '1157152000', '19063003', '700000006', '271651005', '716424007']}, 'type'=>'CodeableConcept', 'path'=>'Goal.description', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/goal-description'}},
        'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Goal.subject', 'min'=>1, 'max'=>1},
        'startDate' => {'type'=>'date', 'path'=>'Goal.start[x]', 'min'=>0, 'max'=>1},
        'startCodeableConcept' => {'valid_codes'=>{'http://snomed.info/sct'=>['32485007', '308283009', '442137000', '386216000']}, 'type'=>'CodeableConcept', 'path'=>'Goal.start[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/goal-start-event'}},
        'acceptance' => {'type'=>'Goal::Acceptance', 'path'=>'Goal.acceptance', 'min'=>0, 'max'=>Float::INFINITY},
        'target' => {'type'=>'Goal::Target', 'path'=>'Goal.target', 'min'=>0, 'max'=>Float::INFINITY},
        'statusDate' => {'type'=>'date', 'path'=>'Goal.statusDate', 'min'=>0, 'max'=>1},
        'statusReason' => {'valid_codes'=>{'http://snomed.info/sct'=>['410536001', '385432009', '713566001', '300936002', '704489009', '11403006']}, 'type'=>'CodeableConcept', 'path'=>'Goal.statusReason', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/goal-status-reason'}},
        'source' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/CareTeam'], 'type'=>'Reference', 'path'=>'Goal.source', 'min'=>0, 'max'=>1},
        'addresses' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Condition', 'http://hl7.org/fhir/StructureDefinition/Observation', 'http://hl7.org/fhir/StructureDefinition/MedicationStatement', 'http://hl7.org/fhir/StructureDefinition/MedicationRequest', 'http://hl7.org/fhir/StructureDefinition/NutritionOrder', 'http://hl7.org/fhir/StructureDefinition/ServiceRequest', 'http://hl7.org/fhir/StructureDefinition/RiskAssessment', 'http://hl7.org/fhir/StructureDefinition/Procedure', 'http://hl7.org/fhir/StructureDefinition/NutritionIntake'], 'type'=>'Reference', 'path'=>'Goal.addresses', 'min'=>0, 'max'=>Float::INFINITY},
        'note' => {'type'=>'Annotation', 'path'=>'Goal.note', 'min'=>0, 'max'=>Float::INFINITY},
        'outcome' => {'type'=>'CodeableReference', 'path'=>'Goal.outcome', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Acceptance < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Acceptance.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Acceptance.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Acceptance.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'individual' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Acceptance.individual', 'min'=>1, 'max'=>1},
          'status' => {'valid_codes'=>{'http://hl7.org/fhir/goal-accept-status'=>['agree', 'disagree', 'pending']}, 'type'=>'code', 'path'=>'Acceptance.status', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/goal-accept-status'}},
          'priority' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/goal-priority'=>['high-priority', 'medium-priority', 'low-priority']}, 'type'=>'CodeableConcept', 'path'=>'Acceptance.priority', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/goal-priority'}}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :individual        # 1-1 Reference(Patient|Practitioner|RelatedPerson)
        attr_accessor :status            # 0-1 code
        attr_accessor :priority          # 0-1 CodeableConcept
      end

      class Target < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'detail' => ['Quantity', 'Range', 'CodeableConcept', 'string', 'boolean', 'integer', 'Ratio'],
          'due' => ['date', 'Duration']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Target.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Target.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Target.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'measure' => {'valid_codes'=>{'http://loinc.org'=>['100000-9', '100001-7', '100002-5', '100003-3', '100004-1', '100005-8', '100006-6', '100007-4', '10000-8', '100008-2', '100009-0', '100010-8', '100011-6', '100012-4', '100013-2', '100014-0', '100015-7', '10001-6', '100016-5', '100017-3', '100018-1', '100019-9', '100020-7', '100021-5', '100022-3', '100023-1', '10002-4', '100024-9', '100025-6', '100026-4', '100027-2', '100028-0', '100029-8', '100030-6', '100031-4', '10003-2', '100032-2', '100033-0', '100034-8', '100035-5', '100036-3', '100037-1', '100038-9', '100039-7', '10004-0', '100040-5', '100041-3', '100042-1', '100043-9', '100044-7', '100045-4', '100046-2', '100047-0', '100048-8', '100049-6', '100050-4', '100051-2', '100052-0', '100053-8', '100054-6', '100055-3', '100056-1', '10005-7', '100057-9', '100058-7', '100059-5', '100060-3', '100061-1', '100062-9', '100063-7', '100064-5', '10006-5', '100065-2', '100066-0', '100067-8', '100068-6', '100069-4', '100070-2', '100071-0', '100072-8', '10007-3', '100073-6', '100074-4', '100075-1', '100076-9', '100077-7', '100078-5', '100079-3', '100080-1', '10008-1', '100081-9', '100082-7', '100083-5', '100084-3', '100085-0', '100086-8', '100087-6', '100088-4', '100089-2', '1000-9', '100090-0', '100091-8', '100092-6', '100093-4', '100094-2', '100095-9', '100096-7', '100097-5', '100098-3', '10009-9', '100099-1', '100100-7', '100101-5', '100102-3', '100103-1', '100104-9', '100105-6', '100106-4', '10010-7', '100107-2', '100108-0', '100109-8', '100110-6', '100111-4', '100112-2', '100113-0', '100114-8', '10011-5', '100115-5', '100116-3', '100117-1', '100118-9', '100119-7', '100120-5', '100121-3', '100122-1', '10012-3', '100123-9', '100124-7', '100125-4', '100126-2', '100127-0', '100128-8', '100129-6', '100130-4', '10013-1', '100131-2', '100132-0', '100133-8', '100134-6', '100135-3', '100136-1', '100137-9', '100138-7', '100139-5', '100140-3', '100141-1', '100142-9', '100143-7', '100144-5', '100145-2', '100146-0', '100147-8', '100148-6', '10014-9', '100149-4', '100150-2', '100151-0', '100152-8', '100153-6', '100154-4', '100155-1', '10015-6', '100156-9', '100157-7', '100158-5', '100159-3', '100160-1', '100161-9', '100162-7', '100163-5', '10016-4', '100164-3', '100165-0', '100166-8', '100167-6', '100168-4', '100169-2', '1001-7', '100170-0', '100171-8', '10017-2', '100172-6', '100173-4', '100174-2', '100175-9', '100176-7', '100177-5', '100178-3', '100179-1', '10018-0', '100180-9', '100181-7', '100182-5', '100183-3', '100184-1', '100185-8', '100186-6', '100187-4', '100188-2', '100189-0', '100190-8', '100191-6', '100192-4', '100193-2', '100194-0', '100195-7', '100196-5', '100197-3', '10019-8', '100198-1', '100199-9', '100200-5', '100201-3', '100202-1', '100203-9', '100204-7', '100205-4', '10020-6', '100206-2', '100207-0', '100208-8', '100209-6', '100210-4', '100211-2', '100212-0', '100213-8', '10021-4', '100214-6', '100215-3', '100216-1', '100217-9', '100218-7', '100219-5', '100220-3', '100221-1', '10022-2', '100222-9', '100223-7', '100224-5', '100225-2', '100226-0', '100227-8', '100228-6', '100229-4', '10023-0', '100230-2', '100231-0', '100232-8', '100233-6', '100234-4', '100235-1', '100236-9', '100237-7', '100238-5', '100239-3', '100240-1', '100241-9', '100242-7', '100243-5', '100244-3', '100245-0', '100246-8', '100247-6', '10024-8', '100248-4', '100249-2', '1002-5', '100250-0', '100251-8', '100252-6', '100253-4', '100254-2', '10025-5', '100255-9', '100256-7', '100257-5', '100258-3', '100259-1', '100260-9', '100261-7', '100262-5', '10026-3', '100263-3', '100264-1', '100265-8', '100266-6', '100267-4', '100268-2', '100269-0', '100270-8', '10027-1', '100271-6', '100272-4', '100273-2', '100274-0', '100275-7', '100276-5', '100277-3', '100278-1', '100279-9', '100280-7', '100281-5', '100282-3', '100283-1', '100284-9', '100285-6', '100286-4', '100287-2', '100288-0', '10028-9', '100289-8', '100290-6', '100291-4', '100292-2', '100293-0', '100294-8', '100295-5', '100296-3', '10029-7', '100297-1', '100298-9', '100299-7', '100300-3', '100301-1', '100302-9', '100303-7', '100304-5', '10030-5', '100305-2', '100306-0', '100307-8', '100308-6', '100309-4', '100310-2', '100311-0', '100312-8', '10031-3', '100313-6', '100314-4', '100315-1', '100316-9', '100317-7', '100318-5', '100319-3', '100320-1', '10032-1', '100321-9', '100322-7', '100323-5', '100324-3', '100325-0', '100326-8', '100327-6', '100328-4', '100329-2', '1003-3', '100330-0', '100331-8', '100332-6', '100333-4', '100334-2', '100335-9', '100336-7', '100337-5', '100338-3', '10033-9', '100339-1', '100340-9', '100341-7', '100342-5', '100343-3', '100344-1', '100345-8', '100346-6', '10034-7', '100347-4', '100348-2', '100349-0', '100350-8', '100351-6', '100352-4', '100353-2', '10035-4', '100354-0', '100355-7', '100356-5', '100357-3', '100358-1', '100359-9', '100360-7', '100361-5', '10036-2', '100362-3', '100363-1', '100364-9', '100365-6', '100366-4', '100367-2', '100368-0', '100369-8', '10037-0', '100370-6', '100371-4', '100372-2', '100373-0', '100374-8', '100375-5', '100376-3', '100377-1', '100378-9', '100379-7', '100380-5', '100381-3', '100382-1', '100383-9', '100384-7', '100385-4', '100386-2', '100387-0', '10038-8', '100388-8', '100389-6', '100390-4', '100391-2', '100392-0', '100393-8', '100394-6', '100395-3', '10039-6', '100396-1', '100397-9', '100398-7', '100399-5', '100400-1', '100401-9', '100402-7', '100403-5', '10040-4', '100404-3', '100405-0', '100406-8', '100407-6', '100408-4', '100409-2', '1004-1', '100410-0', '100411-8', '10041-2', '100412-6', '100413-4', '100414-2', '100415-9', '100416-7', '100417-5', '100418-3', '100419-1', '10042-0', '100420-9', '100421-7', '100422-5', '100423-3', '100424-1', '100425-8', '100426-6', '100427-4', '100428-2', '100429-0', '100430-8', '100431-6', '100432-4', '100433-2', '100434-0', '100435-7', '100436-5', '100437-3', '10043-8', '100438-1', '100439-9', '100440-7', '100441-5', '100442-3', '100443-1', '100444-9', '100445-6', '10044-6', '100446-4', '100447-2', '100448-0', '100449-8', '100450-6', '100451-4', '100452-2', '10045-3', '100453-0', '100454-8', '100455-5', '100456-3', '100457-1', '100458-9', '100459-7', '100460-5', '10046-1', '100461-3', '100462-1', '100463-9', '100464-7', '100465-4', '100466-2', '100467-0', '100468-8', '100469-6', '100470-4', '100471-2', '100472-0', '100473-8', '100474-6', '100475-3', '100476-1', '100477-9', '100478-7', '10047-9', '100479-5', '100480-3', '100481-1', '100482-9', '100483-7', '100484-5', '100485-2', '100486-0', '10048-7', '100487-8', '100488-6', '100489-4', '100490-2', '100491-0', '100492-8', '100493-6', '100494-4', '10049-5', '100495-1', '100496-9', '100497-7', '100498-5', '100499-3', '100500-8', '100501-6', '100502-4', '10050-3', '100503-2', '100504-0', '100505-7', '100506-5', '100507-3', '100508-1', '100509-9', '100510-7', '10051-1', '100511-5', '100512-3', '100513-1', '100514-9', '100515-6', '100516-4', '100517-2', '100518-0', '100519-8', '100520-6', '100521-4', '100522-2', '100523-0', '100524-8', '100525-5', '100526-3', '100527-1', '100528-9', '10052-9', '100529-7', '100530-5', '100531-3', '100532-1', '100533-9', '100534-7', '100535-4', '100536-2', '10053-7', '100537-0', '100538-8', '100539-6', '100540-4', '100541-2', '100542-0', '100543-8', '100544-6', '10054-5', '100545-3', '100546-1', '100547-9', '100548-7', '100549-5', '100550-3', '100551-1', '10055-2', '100552-9', '100553-7', '100554-5', '100555-2', '100556-0', '100557-8', '100558-6', '100559-4', '10056-0', '100560-2', '100561-0', '100562-8', '100563-6', '100564-4', '100565-1', '100566-9', '100567-7', '100568-5', '100569-3', '100570-1', '100571-9', '100572-7', '100573-5', '100574-3', '100575-0', '100576-8', '100577-6', '10057-8', '100578-4', '100579-2', '1005-8', '100580-0', '100581-8', '100582-6', '100583-4', '100584-2', '100585-9', '10058-6', '100586-7', '100587-5', '100588-3', '100589-1', '100590-9', '100591-7', '100592-5', '100593-3', '10059-4', '100594-1', '100595-8', '100596-6', '100597-4', '100598-2', '100599-0', '100600-6', '100601-4', '10060-2', '100602-2', '100603-0', '100604-8', '100605-5', '100606-3', '100607-1', '100608-9', '100609-7', '10061-0', '100610-5', '100611-3', '100612-1', '100613-9', '100614-7', '100615-4', '100616-2', '100617-0', '100618-8', '100619-6', '100620-4', '100621-2', '100622-0', '100623-8', '100624-6', '100625-3', '100626-1', '100627-9', '10062-8', '100628-7', '100629-5', '100630-3', '100631-1', '100632-9', '100633-7', '100634-5', '100635-2', '10063-6', '100636-0', '100637-8', '100638-6', '100639-4', '100640-2', '100641-0', '100642-8', '100643-6', '10064-4', '100644-4', '100645-1', '100646-9', '100647-7', '100648-5', '100649-3', '100650-1', '10065-1', '100651-9', '100652-7', '100653-5', '100654-3', '100655-0', '100656-8', '100657-6', '100658-4', '100659-2', '1006-6', '100660-0', '100661-8', '100662-6', '100663-4', '100664-2', '100665-9', '100666-7', '100667-5', '100668-3', '10066-9', '100669-1', '100670-9', '100671-7', '100672-5', '100673-3', '100674-1', '100675-8', '100676-6', '10067-7', '100677-4', '100678-2', '100679-0', '100680-8', '100681-6', '100682-4', '100683-2', '100684-0', '10068-5', '100685-7', '100686-5', '100687-3', '100688-1', '100689-9', '100690-7', '100691-5', '100692-3', '10069-3', '100693-1', '100694-9', '100695-6', '100696-4', '100697-2', '100698-0', '100699-8', '100700-4', '10070-1', '100701-2', '100702-0', '100703-8', '100704-6', '100705-3', '100706-1', '100707-9', '100708-7', '100709-5', '100710-3', '100711-1', '100712-9', '100713-7', '100714-5', '100715-2', '100716-0', '100717-8', '100718-6', '10071-9', '100719-4', '100720-2', '100721-0', '100722-8', '100723-6', '100724-4', '100725-1', '100726-9', '10072-7', '100727-7', '100728-5', '100729-3', '100730-1', '100731-9', '100732-7', '100733-5', '100734-3', '10073-5', '100735-0', '100736-8', '100737-6', '100738-4', '100739-2', '1007-4', '100740-0', '100741-8', '100742-6', '10074-3', '100743-4', '100744-2', '100745-9', '100746-7', '100747-5', '100748-3', '100749-1', '10075-0', '100750-9', '100751-7', '100752-5', '100753-3', '100754-1', '100755-8', '100756-6', '100757-4', '100758-2', '100759-0', '100760-8', '100761-6', '100762-4', '100763-2', '100764-0', '100765-7', '100766-5', '100767-3', '10076-8', '100768-1', '100769-9', '100770-7', '100771-5', '100772-3', '100773-1', '100774-9', '100775-6', '10077-6', '100776-4', '100777-2', '100778-0', '100779-8', '100780-6', '100781-4', '100782-2', '100783-0', '10078-4', '100784-8', '100785-5', '100786-3', '100787-1', '100788-9', '100789-7', '100790-5', '100791-3', '10079-2', '100792-1', '100793-9', '100794-7', '100795-4', '100796-2', '100797-0', '100798-8', '100799-6', '100-8', '10080-0', '100800-2', '100801-0', '100802-8', '100803-6', '100804-4', '100805-1', '100806-9', '100807-7', '100808-5', '100809-3', '100810-1', '100811-9', '100812-7', '100813-5', '100814-3', '100815-0', '100816-8', '100817-6', '10081-8', '100818-4', '100819-2', '1008-2', '100820-0', '100821-8', '100822-6', '100823-4', '100824-2', '100825-9', '10082-6', '100826-7', '100827-5', '100828-3', '100829-1', '100830-9', '100831-7', '100832-5', '100833-3', '10083-4', '100834-1', '100835-8', '100836-6', '100837-4', '100838-2', '100839-0', '100840-8', '100841-6', '10084-2', '100842-4', '100843-2', '100844-0', '100845-7', '100846-5', '100847-3', '100848-1', '100849-9', '100850-7', '100851-5', '100852-3', '100853-1', '100854-9', '100855-6', '100856-4', '100857-2', '100858-0', '10085-9', '100859-8', '100860-6', '100861-4', '100862-2', '100863-0', '100864-8', '100865-5', '100866-3', '10086-7', '100867-1', '100868-9', '100869-7', '100870-5', '100871-3', '100872-1', '100873-9', '100874-7', '10087-5', '100875-4', '100876-2', '100877-0', '100878-8', '100879-6', '100880-4', '100881-2', '100882-0', '10088-3', '100883-8', '100884-6', '100885-3', '100886-1', '100887-9', '100888-7', '100889-5', '100890-3', '10089-1', '100891-1', '100892-9', '100893-7', '100894-5', '100895-2', '100896-0', '100897-8', '100898-6', '100899-4']}, 'type'=>'CodeableConcept', 'path'=>'Target.measure', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/observation-codes'}},
          'detailQuantity' => {'type'=>'Quantity', 'path'=>'Target.detail[x]', 'min'=>0, 'max'=>1},
          'detailRange' => {'type'=>'Range', 'path'=>'Target.detail[x]', 'min'=>0, 'max'=>1},
          'detailCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Target.detail[x]', 'min'=>0, 'max'=>1},
          'detailString' => {'type'=>'string', 'path'=>'Target.detail[x]', 'min'=>0, 'max'=>1},
          'detailBoolean' => {'type'=>'boolean', 'path'=>'Target.detail[x]', 'min'=>0, 'max'=>1},
          'detailInteger' => {'type'=>'integer', 'path'=>'Target.detail[x]', 'min'=>0, 'max'=>1},
          'detailRatio' => {'type'=>'Ratio', 'path'=>'Target.detail[x]', 'min'=>0, 'max'=>1},
          'dueDate' => {'type'=>'date', 'path'=>'Target.due[x]', 'min'=>0, 'max'=>1},
          'dueDuration' => {'type'=>'Duration', 'path'=>'Target.due[x]', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                    # 0-1 string
        attr_accessor :extension             # 0-* [ Extension ]
        attr_accessor :modifierExtension     # 0-* [ Extension ]
        attr_accessor :measure               # 0-1 CodeableConcept
        attr_accessor :detailQuantity        # 0-1 Quantity
        attr_accessor :detailRange           # 0-1 Range
        attr_accessor :detailCodeableConcept # 0-1 CodeableConcept
        attr_accessor :detailString          # 0-1 string
        attr_accessor :detailBoolean         # 0-1 boolean
        attr_accessor :detailInteger         # 0-1 integer
        attr_accessor :detailRatio           # 0-1 Ratio
        attr_accessor :dueDate               # 0-1 date
        attr_accessor :dueDuration           # 0-1 Duration
      end

      attr_accessor :id                   # 0-1 id
      attr_accessor :meta                 # 0-1 Meta
      attr_accessor :implicitRules        # 0-1 uri
      attr_accessor :language             # 0-1 code
      attr_accessor :text                 # 0-1 Narrative
      attr_accessor :contained            # 0-* [ Resource ]
      attr_accessor :extension            # 0-* [ Extension ]
      attr_accessor :modifierExtension    # 0-* [ Extension ]
      attr_accessor :identifier           # 0-* [ Identifier ]
      attr_accessor :lifecycleStatus      # 1-1 code
      attr_accessor :achievementStatus    # 0-1 CodeableConcept
      attr_accessor :category             # 0-* [ CodeableConcept ]
      attr_accessor :continuous           # 0-1 boolean
      attr_accessor :priority             # 0-1 CodeableConcept
      attr_accessor :description          # 1-1 CodeableConcept
      attr_accessor :subject              # 1-1 Reference(Patient|Group|Organization)
      attr_accessor :startDate            # 0-1 date
      attr_accessor :startCodeableConcept # 0-1 CodeableConcept
      attr_accessor :acceptance           # 0-* [ Goal::Acceptance ]
      attr_accessor :target               # 0-* [ Goal::Target ]
      attr_accessor :statusDate           # 0-1 date
      attr_accessor :statusReason         # 0-* [ CodeableConcept ]
      attr_accessor :source               # 0-1 Reference(Patient|Practitioner|PractitionerRole|RelatedPerson|CareTeam)
      attr_accessor :addresses            # 0-* [ Reference(Condition|Observation|MedicationStatement|MedicationRequest|NutritionOrder|ServiceRequest|RiskAssessment|Procedure|NutritionIntake) ]
      attr_accessor :note                 # 0-* [ Annotation ]
      attr_accessor :outcome              # 0-* [ CodeableReference ]

      def resourceType
        'Goal'
      end
    end
  end
end