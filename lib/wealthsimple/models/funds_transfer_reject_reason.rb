require 'date'

module Wealthsimple
  class FundsTransferRejectReason
    
    BANK_NO_MATCH = "bank_no_match".freeze
    FUNDS_NOT_CLEARED = "funds_not_cleared".freeze
    INVALID_BANK = "invalid_bank".freeze
    NSF = "nsf".freeze
    CANNOT_TRACE = "cannot_trace".freeze
    STOP_PAYMENT = "stop_payment".freeze

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      constantValues = FundsTransferRejectReason.constants.select{|c| FundsTransferRejectReason::const_get(c) == value}
      raise "Invalid ENUM value #{value} for class #FundsTransferRejectReason" if constantValues.empty?
      value
    end
  end

end
