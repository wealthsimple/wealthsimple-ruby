require 'date'

module Wealthsimple
  class FundsTransferStatus
    
    PENDING = "pending".freeze
    POSTED = "posted".freeze
    ACCEPTED = "accepted".freeze
    REJECTED = "rejected".freeze
    DELETED = "deleted".freeze

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      constantValues = FundsTransferStatus.constants.select{|c| FundsTransferStatus::const_get(c) == value}
      raise "Invalid ENUM value #{value} for class #FundsTransferStatus" if constantValues.empty?
      value
    end
  end

end
