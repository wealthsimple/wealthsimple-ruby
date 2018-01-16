require 'date'

module Wealthsimple
  class Locale
    
    EN_CA = "en-CA".freeze
    EN_US = "en-US".freeze
    EN_GB = "en-GB".freeze
    FR_CA = "fr-CA".freeze

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      constantValues = Locale.constants.select{|c| Locale::const_get(c) == value}
      raise "Invalid ENUM value #{value} for class #Locale" if constantValues.empty?
      value
    end
  end

end
