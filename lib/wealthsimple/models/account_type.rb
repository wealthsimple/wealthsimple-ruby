require 'date'

module Wealthsimple
  class AccountType
    
    CA_TFSA = "ca_tfsa".freeze
    CA_RRSP = "ca_rrsp".freeze
    CA_NON_REGISTERED = "ca_non_registered".freeze
    US_INDIVIDUAL = "us_individual".freeze
    US_ROTH_IRA = "us_roth_ira".freeze
    US_TRADITIONAL_IRA = "us_traditional_ira".freeze
    GB_INDIVIDUAL = "gb_individual".freeze
    GB_ISA = "gb_isa".freeze

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      constantValues = AccountType.constants.select{|c| AccountType::const_get(c) == value}
      raise "Invalid ENUM value #{value} for class #AccountType" if constantValues.empty?
      value
    end
  end

end
