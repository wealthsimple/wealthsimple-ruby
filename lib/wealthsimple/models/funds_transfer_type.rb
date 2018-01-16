require 'date'

module Wealthsimple
  class FundsTransferType
    
    DEPOSIT = "deposit".freeze
    WITHDRAWAL = "withdrawal".freeze

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      constantValues = FundsTransferType.constants.select{|c| FundsTransferType::const_get(c) == value}
      raise "Invalid ENUM value #{value} for class #FundsTransferType" if constantValues.empty?
      value
    end
  end

end
