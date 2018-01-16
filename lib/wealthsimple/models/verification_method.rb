require 'date'

module Wealthsimple
  class VerificationMethod
    
    BANK_SCREENSHOT = "bank_screenshot".freeze
    BANK_STATEMENT = "bank_statement".freeze
    CLEARED_CHEQUE = "cleared_cheque".freeze
    DIRECT_DEPOSIT = "direct_deposit".freeze
    PARTIAL_BANK_STATEMENT = "partial_bank_statement".freeze
    VOID_CHEQUE = "void_cheque".freeze
    THIRD_PARTY = "third_party".freeze
    MICRODEPOSIT = "microdeposit".freeze

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      constantValues = VerificationMethod.constants.select{|c| VerificationMethod::const_get(c) == value}
      raise "Invalid ENUM value #{value} for class #VerificationMethod" if constantValues.empty?
      value
    end
  end

end
