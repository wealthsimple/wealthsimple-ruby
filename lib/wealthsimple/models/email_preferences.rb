require 'date'

module Wealthsimple

  class EmailPreferences
    # If true, we will send out over email any marketing material related to promotions or tips.
    attr_accessor :marketing

    # If true, we will send out over email any news and annoucements
    attr_accessor :news_and_announcements

    # If true, we will send out over email any notifications of corporate actions including dividends.
    attr_accessor :corporate_actions

    # If true, we will send out over email whenever a deposit has been received.
    attr_accessor :deposits

    # If true, we will send out over email whenever a withdrawal has been initiated.
    attr_accessor :withdrawals

    # If true, we will send out over email any trades made for the day.
    attr_accessor :trade_confirms

    # If true, we will send out tax statements over email.
    attr_accessor :tax_statements

    # If true, we will send out disclosures over email.
    attr_accessor :disclosures

    # If true, we will send out a daily statement of the client's accounts at the end-of-day.
    attr_accessor :daily_statements

    # If true, we will send out a monthly statement of the client's accounts at the end-of-month.
    attr_accessor :monthly_statements


    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'marketing' => :'marketing',
        :'news_and_announcements' => :'news_and_announcements',
        :'corporate_actions' => :'corporate_actions',
        :'deposits' => :'deposits',
        :'withdrawals' => :'withdrawals',
        :'trade_confirms' => :'trade_confirms',
        :'tax_statements' => :'tax_statements',
        :'disclosures' => :'disclosures',
        :'daily_statements' => :'daily_statements',
        :'monthly_statements' => :'monthly_statements'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'marketing' => :'BOOLEAN',
        :'news_and_announcements' => :'BOOLEAN',
        :'corporate_actions' => :'BOOLEAN',
        :'deposits' => :'BOOLEAN',
        :'withdrawals' => :'BOOLEAN',
        :'trade_confirms' => :'BOOLEAN',
        :'tax_statements' => :'BOOLEAN',
        :'disclosures' => :'BOOLEAN',
        :'daily_statements' => :'BOOLEAN',
        :'monthly_statements' => :'BOOLEAN'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}){|(k,v), h| h[k.to_sym] = v}

      if attributes.has_key?(:'marketing')
        self.marketing = attributes[:'marketing']
      else
        self.marketing = false
      end

      if attributes.has_key?(:'news_and_announcements')
        self.news_and_announcements = attributes[:'news_and_announcements']
      else
        self.news_and_announcements = false
      end

      if attributes.has_key?(:'corporate_actions')
        self.corporate_actions = attributes[:'corporate_actions']
      else
        self.corporate_actions = false
      end

      if attributes.has_key?(:'deposits')
        self.deposits = attributes[:'deposits']
      else
        self.deposits = false
      end

      if attributes.has_key?(:'withdrawals')
        self.withdrawals = attributes[:'withdrawals']
      else
        self.withdrawals = false
      end

      if attributes.has_key?(:'trade_confirms')
        self.trade_confirms = attributes[:'trade_confirms']
      else
        self.trade_confirms = false
      end

      if attributes.has_key?(:'tax_statements')
        self.tax_statements = attributes[:'tax_statements']
      else
        self.tax_statements = false
      end

      if attributes.has_key?(:'disclosures')
        self.disclosures = attributes[:'disclosures']
      else
        self.disclosures = false
      end

      if attributes.has_key?(:'daily_statements')
        self.daily_statements = attributes[:'daily_statements']
      else
        self.daily_statements = false
      end

      if attributes.has_key?(:'monthly_statements')
        self.monthly_statements = attributes[:'monthly_statements']
      else
        self.monthly_statements = false
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
          marketing == o.marketing &&
          news_and_announcements == o.news_and_announcements &&
          corporate_actions == o.corporate_actions &&
          deposits == o.deposits &&
          withdrawals == o.withdrawals &&
          trade_confirms == o.trade_confirms &&
          tax_statements == o.tax_statements &&
          disclosures == o.disclosures &&
          daily_statements == o.daily_statements &&
          monthly_statements == o.monthly_statements
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [marketing, news_and_announcements, corporate_actions, deposits, withdrawals, trade_confirms, tax_statements, disclosures, daily_statements, monthly_statements].hash
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
