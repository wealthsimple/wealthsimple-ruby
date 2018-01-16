require 'date'

module Wealthsimple
  class Currency
    
    CAD = "CAD".freeze
    USD = "USD".freeze
    EUR = "EUR".freeze
    GBP = "GBP".freeze

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      constantValues = Currency.constants.select{|c| Currency::const_get(c) == value}
      raise "Invalid ENUM value #{value} for class #Currency" if constantValues.empty?
      value
    end
  end

end
