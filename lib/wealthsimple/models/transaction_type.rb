require 'date'

module Wealthsimple
  class TransactionType
    
    BUY = "buy".freeze
    CONTRIBUTION = "contribution".freeze
    CUSTODIAN_FEE = "custodian_fee".freeze
    DEPOSIT = "deposit".freeze
    DIVIDEND = "dividend".freeze
    FEE = "fee".freeze
    FOREX = "forex".freeze
    GRANT = "grant".freeze
    HOME_BUYERS_PLAN = "home_buyers_plan".freeze
    HST = "hst".freeze
    CHARGED_INTEREST = "charged_interest".freeze
    JOURNAL = "journal".freeze
    NON_RESIDENT_WITHHOLDING_TAX = "non_resident_withholding_tax".freeze
    REDEMPTION = "redemption".freeze
    RISK_EXPOSURE_FEE = "risk_exposure_fee".freeze
    REFUND = "refund".freeze
    REIMBURSEMENT = "reimbursement".freeze
    SELL = "sell".freeze
    STOCK_DISTRIBUTION = "stock_distribution".freeze
    STOCK_DIVIDEND = "stock_dividend".freeze
    TRANSFER_IN = "transfer_in".freeze
    TRANSFER_OUT = "transfer_out".freeze
    WITHHOLDING_TAX = "withholding_tax".freeze
    WITHDRAWAL = "withdrawal".freeze

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      constantValues = TransactionType.constants.select{|c| TransactionType::const_get(c) == value}
      raise "Invalid ENUM value #{value} for class #TransactionType" if constantValues.empty?
      value
    end
  end

end
