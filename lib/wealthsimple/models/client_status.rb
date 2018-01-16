require 'date'

module Wealthsimple
  class ClientStatus
    
    INCOMPLETE = "incomplete".freeze
    COMPLETE = "complete".freeze

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      constantValues = ClientStatus.constants.select{|c| ClientStatus::const_get(c) == value}
      raise "Invalid ENUM value #{value} for class #ClientStatus" if constantValues.empty?
      value
    end
  end

end
