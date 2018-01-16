require 'date'

module Wealthsimple
  class WithdrawalType
    
    FULL = "full".freeze
    PARTIAL = "partial".freeze

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      constantValues = WithdrawalType.constants.select{|c| WithdrawalType::const_get(c) == value}
      raise "Invalid ENUM value #{value} for class #WithdrawalType" if constantValues.empty?
      value
    end
  end

end
