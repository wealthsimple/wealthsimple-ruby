require 'date'

module Wealthsimple
  class ClientType
    
    PERSON = "person".freeze
    TRUST = "trust".freeze
    CORPORATION = "corporation".freeze

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      constantValues = ClientType.constants.select{|c| ClientType::const_get(c) == value}
      raise "Invalid ENUM value #{value} for class #ClientType" if constantValues.empty?
      value
    end
  end

end
