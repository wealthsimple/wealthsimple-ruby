require 'date'

module Wealthsimple
  class Gender
    
    MALE = "male".freeze
    FEMALE = "female".freeze
    OTHER = "other".freeze

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      constantValues = Gender.constants.select{|c| Gender::const_get(c) == value}
      raise "Invalid ENUM value #{value} for class #Gender" if constantValues.empty?
      value
    end
  end

end
