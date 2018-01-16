require 'date'

module Wealthsimple

  class TaxDetail
    attr_accessor :id

    attr_accessor :gross_amount

    attr_accessor :base_gross_amount

    attr_accessor :excess_gross_amount

    attr_accessor :net_amount

    attr_accessor :tax_override_percentage

    attr_accessor :federal_tax_amount

    attr_accessor :federal_tax_percentage

    attr_accessor :provincial_tax_amount

    attr_accessor :provincial_tax_percentage

    attr_accessor :province

    attr_accessor :country

    attr_accessor :account_type

    attr_accessor :person_or_spouse_age

    attr_accessor :account_market_value

    attr_accessor :account_market_value_previous_year

    attr_accessor :tax_year

    attr_accessor :document_url


    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'id' => :'id',
        :'gross_amount' => :'gross_amount',
        :'base_gross_amount' => :'base_gross_amount',
        :'excess_gross_amount' => :'excess_gross_amount',
        :'net_amount' => :'net_amount',
        :'tax_override_percentage' => :'tax_override_percentage',
        :'federal_tax_amount' => :'federal_tax_amount',
        :'federal_tax_percentage' => :'federal_tax_percentage',
        :'provincial_tax_amount' => :'provincial_tax_amount',
        :'provincial_tax_percentage' => :'provincial_tax_percentage',
        :'province' => :'province',
        :'country' => :'country',
        :'account_type' => :'account_type',
        :'person_or_spouse_age' => :'person_or_spouse_age',
        :'account_market_value' => :'account_market_value',
        :'account_market_value_previous_year' => :'account_market_value_previous_year',
        :'tax_year' => :'tax_year',
        :'document_url' => :'document_url'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'id' => :'TaxDetailId',
        :'gross_amount' => :'Money',
        :'base_gross_amount' => :'Money',
        :'excess_gross_amount' => :'Money',
        :'net_amount' => :'Money',
        :'tax_override_percentage' => :'Percent',
        :'federal_tax_amount' => :'Money',
        :'federal_tax_percentage' => :'Percent',
        :'provincial_tax_amount' => :'Money',
        :'provincial_tax_percentage' => :'Percent',
        :'province' => :'Province',
        :'country' => :'CountryCode',
        :'account_type' => :'AccountType',
        :'person_or_spouse_age' => :'Integer',
        :'account_market_value' => :'Money',
        :'account_market_value_previous_year' => :'Money',
        :'tax_year' => :'Integer',
        :'document_url' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}){|(k,v), h| h[k.to_sym] = v}

      if attributes.has_key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.has_key?(:'gross_amount')
        self.gross_amount = attributes[:'gross_amount']
      end

      if attributes.has_key?(:'base_gross_amount')
        self.base_gross_amount = attributes[:'base_gross_amount']
      end

      if attributes.has_key?(:'excess_gross_amount')
        self.excess_gross_amount = attributes[:'excess_gross_amount']
      end

      if attributes.has_key?(:'net_amount')
        self.net_amount = attributes[:'net_amount']
      end

      if attributes.has_key?(:'tax_override_percentage')
        self.tax_override_percentage = attributes[:'tax_override_percentage']
      end

      if attributes.has_key?(:'federal_tax_amount')
        self.federal_tax_amount = attributes[:'federal_tax_amount']
      end

      if attributes.has_key?(:'federal_tax_percentage')
        self.federal_tax_percentage = attributes[:'federal_tax_percentage']
      end

      if attributes.has_key?(:'provincial_tax_amount')
        self.provincial_tax_amount = attributes[:'provincial_tax_amount']
      end

      if attributes.has_key?(:'provincial_tax_percentage')
        self.provincial_tax_percentage = attributes[:'provincial_tax_percentage']
      end

      if attributes.has_key?(:'province')
        self.province = attributes[:'province']
      end

      if attributes.has_key?(:'country')
        self.country = attributes[:'country']
      end

      if attributes.has_key?(:'account_type')
        self.account_type = attributes[:'account_type']
      end

      if attributes.has_key?(:'person_or_spouse_age')
        self.person_or_spouse_age = attributes[:'person_or_spouse_age']
      end

      if attributes.has_key?(:'account_market_value')
        self.account_market_value = attributes[:'account_market_value']
      end

      if attributes.has_key?(:'account_market_value_previous_year')
        self.account_market_value_previous_year = attributes[:'account_market_value_previous_year']
      end

      if attributes.has_key?(:'tax_year')
        self.tax_year = attributes[:'tax_year']
      end

      if attributes.has_key?(:'document_url')
        self.document_url = attributes[:'document_url']
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
          id == o.id &&
          gross_amount == o.gross_amount &&
          base_gross_amount == o.base_gross_amount &&
          excess_gross_amount == o.excess_gross_amount &&
          net_amount == o.net_amount &&
          tax_override_percentage == o.tax_override_percentage &&
          federal_tax_amount == o.federal_tax_amount &&
          federal_tax_percentage == o.federal_tax_percentage &&
          provincial_tax_amount == o.provincial_tax_amount &&
          provincial_tax_percentage == o.provincial_tax_percentage &&
          province == o.province &&
          country == o.country &&
          account_type == o.account_type &&
          person_or_spouse_age == o.person_or_spouse_age &&
          account_market_value == o.account_market_value &&
          account_market_value_previous_year == o.account_market_value_previous_year &&
          tax_year == o.tax_year &&
          document_url == o.document_url
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [id, gross_amount, base_gross_amount, excess_gross_amount, net_amount, tax_override_percentage, federal_tax_amount, federal_tax_percentage, provincial_tax_amount, provincial_tax_percentage, province, country, account_type, person_or_spouse_age, account_market_value, account_market_value_previous_year, tax_year, document_url].hash
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
