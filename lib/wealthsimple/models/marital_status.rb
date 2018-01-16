require 'date'

module Wealthsimple
  class MaritalStatus
    
    SINGLE = "single".freeze
    MARRIED = "married".freeze
    COMMON_LAW = "common_law".freeze
    SEPARATED = "separated".freeze
    WIDOWED = "widowed".freeze
    DIVORCED = "divorced".freeze

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      constantValues = MaritalStatus.constants.select{|c| MaritalStatus::const_get(c) == value}
      raise "Invalid ENUM value #{value} for class #MaritalStatus" if constantValues.empty?
      value
    end
  end

end
