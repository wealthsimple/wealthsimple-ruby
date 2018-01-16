require 'date'

module Wealthsimple
  class VerificationStatus
    
    PENDING_REIVEW = "pending_reivew".freeze
    ACCEPTED = "accepted".freeze
    REJECTED = "rejected".freeze

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      constantValues = VerificationStatus.constants.select{|c| VerificationStatus::const_get(c) == value}
      raise "Invalid ENUM value #{value} for class #VerificationStatus" if constantValues.empty?
      value
    end
  end

end
