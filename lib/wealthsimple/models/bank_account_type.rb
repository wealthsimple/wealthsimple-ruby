require 'date'

module Wealthsimple
  class BankAccountType
    
    CHEQUING = "chequing".freeze
    SAVINGS = "savings".freeze

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      constantValues = BankAccountType.constants.select{|c| BankAccountType::const_get(c) == value}
      raise "Invalid ENUM value #{value} for class #BankAccountType" if constantValues.empty?
      value
    end
  end

end
