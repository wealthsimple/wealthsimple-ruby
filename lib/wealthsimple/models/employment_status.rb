require 'date'

module Wealthsimple
  class EmploymentStatus
    
    EMPLOYED = "employed".freeze
    SELF_EMPLOYED = "self_employed".freeze
    RETIRED = "retired".freeze
    UNEMPLOYED = "unemployed".freeze
    STUDENT = "student".freeze

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      constantValues = EmploymentStatus.constants.select{|c| EmploymentStatus::const_get(c) == value}
      raise "Invalid ENUM value #{value} for class #EmploymentStatus" if constantValues.empty?
      value
    end
  end

end
