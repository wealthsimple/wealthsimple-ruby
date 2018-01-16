require 'date'

module Wealthsimple

  class WithdrawalRequest
    attr_accessor :bank_account_id

    attr_accessor :account_id

    attr_accessor :value

    attr_accessor :post_dated

    attr_accessor :external_id

    attr_accessor :withdrawal_type

    attr_accessor :withdrawal_reason


    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'bank_account_id' => :'bank_account_id',
        :'account_id' => :'account_id',
        :'value' => :'value',
        :'post_dated' => :'post_dated',
        :'external_id' => :'external_id',
        :'withdrawal_type' => :'withdrawal_type',
        :'withdrawal_reason' => :'withdrawal_reason'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'bank_account_id' => :'BankAccountId',
        :'account_id' => :'AccountId',
        :'value' => :'Money',
        :'post_dated' => :'Date',
        :'external_id' => :'ExternalId',
        :'withdrawal_type' => :'WithdrawalType',
        :'withdrawal_reason' => :'WithdrawalReason'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}){|(k,v), h| h[k.to_sym] = v}

      if attributes.has_key?(:'bank_account_id')
        self.bank_account_id = attributes[:'bank_account_id']
      end

      if attributes.has_key?(:'account_id')
        self.account_id = attributes[:'account_id']
      end

      if attributes.has_key?(:'value')
        self.value = attributes[:'value']
      end

      if attributes.has_key?(:'post_dated')
        self.post_dated = attributes[:'post_dated']
      end

      if attributes.has_key?(:'external_id')
        self.external_id = attributes[:'external_id']
      end

      if attributes.has_key?(:'withdrawal_type')
        self.withdrawal_type = attributes[:'withdrawal_type']
      end

      if attributes.has_key?(:'withdrawal_reason')
        self.withdrawal_reason = attributes[:'withdrawal_reason']
      end

    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @bank_account_id.nil?
        invalid_properties.push("invalid value for 'bank_account_id', bank_account_id cannot be nil.")
      end

      if @account_id.nil?
        invalid_properties.push("invalid value for 'account_id', account_id cannot be nil.")
      end

      if @value.nil?
        invalid_properties.push("invalid value for 'value', value cannot be nil.")
      end

      return invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @bank_account_id.nil?
      return false if @account_id.nil?
      return false if @value.nil?
      return true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          bank_account_id == o.bank_account_id &&
          account_id == o.account_id &&
          value == o.value &&
          post_dated == o.post_dated &&
          external_id == o.external_id &&
          withdrawal_type == o.withdrawal_type &&
          withdrawal_reason == o.withdrawal_reason
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [bank_account_id, account_id, value, post_dated, external_id, withdrawal_type, withdrawal_reason].hash
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
        temp_model = Wealthsimple.const_get(type).new
        temp_model.build_from_hash(value)
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
