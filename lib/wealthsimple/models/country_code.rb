require 'date'

module Wealthsimple
  class CountryCode
    
    CA = "CA".freeze
    GB = "GB".freeze
    US = "US".freeze

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      constantValues = CountryCode.constants.select{|c| CountryCode::const_get(c) == value}
      raise "Invalid ENUM value #{value} for class #CountryCode" if constantValues.empty?
      value
    end
  end

end
