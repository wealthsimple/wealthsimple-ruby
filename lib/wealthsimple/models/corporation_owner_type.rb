require 'date'

module Wealthsimple
  class CorporationOwnerType
    
    PERSON = "person".freeze
    CORPORATION = "corporation".freeze
    TRUST = "trust".freeze

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      constantValues = CorporationOwnerType.constants.select{|c| CorporationOwnerType::const_get(c) == value}
      raise "Invalid ENUM value #{value} for class #CorporationOwnerType" if constantValues.empty?
      value
    end
  end

end
