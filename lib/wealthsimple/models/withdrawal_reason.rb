require 'date'

module Wealthsimple
  class WithdrawalReason
    
    BUYING_HOME = "buying_home".freeze
    EMERGENCY = "emergency".freeze
    HARDSHIP = "hardship".freeze
    HOME_BUYERS_PLAN = "home_buyers_plan".freeze
    LIFELONG_LEARNING_PLAN = "lifelong_learning_plan".freeze
    FLUCTUATION = "fluctuation".freeze
    RETIREMENT_INCOME = "retirement_income".freeze
    DEBT_REPAYMENT = "debt_repayment".freeze
    DISSATISFIED = "dissatisfied".freeze
    OTHER = "other".freeze
    PURCHASE = "purchase".freeze

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      constantValues = WithdrawalReason.constants.select{|c| WithdrawalReason::const_get(c) == value}
      raise "Invalid ENUM value #{value} for class #WithdrawalReason" if constantValues.empty?
      value
    end
  end

end
