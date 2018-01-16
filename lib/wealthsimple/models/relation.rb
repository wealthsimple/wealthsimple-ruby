require 'date'

module Wealthsimple
  class Relation
    
    SELF = "self".freeze
    SPOUSE = "spouse".freeze
    CHILD = "child".freeze
    PARENT = "parent".freeze
    PARENT_IN_LAW = "parent_in_law".freeze
    SIBLING = "sibling".freeze
    ASSOCIATE = "associate".freeze
    OTHER = "other".freeze

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      constantValues = Relation.constants.select{|c| Relation::const_get(c) == value}
      raise "Invalid ENUM value #{value} for class #Relation" if constantValues.empty?
      value
    end
  end

end
