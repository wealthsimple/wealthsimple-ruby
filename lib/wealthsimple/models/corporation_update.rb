require 'date'

module Wealthsimple

  class CorporationUpdate
    attr_accessor :email

    attr_accessor :phone_numbers

    attr_accessor :user_id

    attr_accessor :external_id

    attr_accessor :locale

    attr_accessor :mailing_address

    attr_accessor :jurisdictions

    attr_accessor :name

    attr_accessor :address

    attr_accessor :beneficial_owners

    attr_accessor :tax_identification_number

    attr_accessor :directors


    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'email' => :'email',
        :'phone_numbers' => :'phone_numbers',
        :'user_id' => :'user_id',
        :'external_id' => :'external_id',
        :'locale' => :'locale',
        :'mailing_address' => :'mailing_address',
        :'jurisdictions' => :'jurisdictions',
        :'name' => :'name',
        :'address' => :'address',
        :'beneficial_owners' => :'beneficial_owners',
        :'tax_identification_number' => :'tax_identification_number',
        :'directors' => :'directors'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'email' => :'Email',
        :'phone_numbers' => :'PhoneNumbers',
        :'user_id' => :'UserId',
        :'external_id' => :'ExternalId',
        :'locale' => :'Locale',
        :'mailing_address' => :'Address',
        :'jurisdictions' => :'Array<CountryCode>',
        :'name' => :'CorporationName',
        :'address' => :'Address',
        :'beneficial_owners' => :'CorporationOwners',
        :'tax_identification_number' => :'TaxIdentification',
        :'directors' => :'CorporationDirectors'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}){|(k,v), h| h[k.to_sym] = v}

      if attributes.has_key?(:'email')
        self.email = attributes[:'email']
      end

      if attributes.has_key?(:'phone_numbers')
        self.phone_numbers = attributes[:'phone_numbers']
      end

      if attributes.has_key?(:'user_id')
        self.user_id = attributes[:'user_id']
      end

      if attributes.has_key?(:'external_id')
        self.external_id = attributes[:'external_id']
      end

      if attributes.has_key?(:'locale')
        self.locale = attributes[:'locale']
      end

      if attributes.has_key?(:'mailing_address')
        self.mailing_address = attributes[:'mailing_address']
      end

      if attributes.has_key?(:'jurisdictions')
        if (value = attributes[:'jurisdictions']).is_a?(Array)
          self.jurisdictions = value
        end
      end

      if attributes.has_key?(:'name')
        self.name = attributes[:'name']
      end

      if attributes.has_key?(:'address')
        self.address = attributes[:'address']
      end

      if attributes.has_key?(:'beneficial_owners')
        self.beneficial_owners = attributes[:'beneficial_owners']
      end

      if attributes.has_key?(:'tax_identification_number')
        self.tax_identification_number = attributes[:'tax_identification_number']
      end

      if attributes.has_key?(:'directors')
        self.directors = attributes[:'directors']
      end

    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      return invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          email == o.email &&
          phone_numbers == o.phone_numbers &&
          user_id == o.user_id &&
          external_id == o.external_id &&
          locale == o.locale &&
          mailing_address == o.mailing_address &&
          jurisdictions == o.jurisdictions &&
          name == o.name &&
          address == o.address &&
          beneficial_owners == o.beneficial_owners &&
          tax_identification_number == o.tax_identification_number &&
          directors == o.directors
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [email, phone_numbers, user_id, external_id, locale, mailing_address, jurisdictions, name, address, beneficial_owners, tax_identification_number, directors].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map{ |v| _deserialize($1, v) } )
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        ::DateTime.parse(value)
      when :Date
        ::Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        if value.is_a?(Hash)
          temp_model = Wealthsimple.const_get(type).new
          temp_model.build_from_hash(value)
        else
          value
        end
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map{ |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end
