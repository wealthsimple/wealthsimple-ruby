require 'date'

module Wealthsimple
  class Province
    
    AB = "AB".freeze
    BC = "BC".freeze
    MB = "MB".freeze
    NB = "NB".freeze
    NL = "NL".freeze
    NF = "NF".freeze
    LB = "LB".freeze
    NT = "NT".freeze
    NS = "NS".freeze
    NU = "NU".freeze
    ON = "ON".freeze
    PE = "PE".freeze
    QC = "QC".freeze
    SK = "SK".freeze
    YT = "YT".freeze

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      constantValues = Province.constants.select{|c| Province::const_get(c) == value}
      raise "Invalid ENUM value #{value} for class #Province" if constantValues.empty?
      value
    end
  end

end
