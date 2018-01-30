# wealthsimple [![CircleCI](https://circleci.com/gh/wealthsimple/wealthsimple-ruby.svg?style=svg&circle-token=b94b7527d2ba8159eac856f679d7b7bf2fbea7be)](https://circleci.com/gh/wealthsimple/wealthsimple-ruby)

Wealthsimple - the Ruby gem for the Wealthsimple API

This SDK is automatically generated by the [Swagger Codegen](https://github.com/swagger-api/swagger-codegen) project:

- API version: 1.0
- Package version: 1.0.0
- Build date: 2018-01-30T11:27:29.219-05:00
- Build package: io.swagger.codegen.languages.RubyClientCodegen

## Installation

Add this to your Gemfile and run `bundle`:

    gem 'wealthsimple', '~> 1.0.0'

## Getting Started

Please follow the [installation](#installation) procedure and then run the following code:
```ruby
# Load the gem
require 'wealthsimple'

# Setup authorization
Wealthsimple.configure do |config|
  # Configure API key authorization: Bearer
  config.api_key['Authorization'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['Authorization'] = 'Bearer'
end

api_instance = Wealthsimple::AccountsApi.new

account = Wealthsimple::AccountInput.new # AccountInput | 


begin
  result = api_instance.create_account(account)
  p result
rescue Wealthsimple::ApiError => e
  puts "Exception when calling AccountsApi->create_account: #{e}"
end

```

## Documentation for API Endpoints

All URIs are relative to *https://api.sandbox.wealthsimple.com/v1*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*Wealthsimple::AccountsApi* | [**create_account**](docs/AccountsApi.md#create_account) | **POST** /accounts | 
*Wealthsimple::AccountsApi* | [**get_account**](docs/AccountsApi.md#get_account) | **GET** /accounts/{account_id} | 
*Wealthsimple::AccountsApi* | [**list_accounts**](docs/AccountsApi.md#list_accounts) | **GET** /accounts | 
*Wealthsimple::AssessmentsApi* | [**list_account_assessments**](docs/AssessmentsApi.md#list_account_assessments) | **GET** /account_assessments | 
*Wealthsimple::AssessmentsApi* | [**list_client_assessments**](docs/AssessmentsApi.md#list_client_assessments) | **GET** /client_assessments | 
*Wealthsimple::CorporationsApi* | [**create_corporation**](docs/CorporationsApi.md#create_corporation) | **POST** /corporations | 
*Wealthsimple::CorporationsApi* | [**get_corporation**](docs/CorporationsApi.md#get_corporation) | **GET** /corporations/{corporation_id} | 
*Wealthsimple::CorporationsApi* | [**list_corporations**](docs/CorporationsApi.md#list_corporations) | **GET** /corporations | 
*Wealthsimple::CorporationsApi* | [**update_corporation**](docs/CorporationsApi.md#update_corporation) | **PATCH** /corporations/{corporation_id} | 
*Wealthsimple::DailyValuesApi* | [**list_daily_values**](docs/DailyValuesApi.md#list_daily_values) | **GET** /daily_values | 
*Wealthsimple::DocumentsApi* | [**create_document**](docs/DocumentsApi.md#create_document) | **POST** /documents | 
*Wealthsimple::DocumentsApi* | [**get_document**](docs/DocumentsApi.md#get_document) | **GET** /documents/{document_id} | 
*Wealthsimple::DocumentsApi* | [**get_document__binary**](docs/DocumentsApi.md#get_document__binary) | **GET** /documents/{document_id}/file | 
*Wealthsimple::DocumentsApi* | [**list_documents**](docs/DocumentsApi.md#list_documents) | **GET** /documents | 
*Wealthsimple::FundingApi* | [**create_a_bank_account**](docs/FundingApi.md#create_a_bank_account) | **POST** /bank_accounts | 
*Wealthsimple::FundingApi* | [**create_deposit**](docs/FundingApi.md#create_deposit) | **POST** /deposits | 
*Wealthsimple::FundingApi* | [**create_withdrawal**](docs/FundingApi.md#create_withdrawal) | **POST** /withdrawals | 
*Wealthsimple::FundingApi* | [**get_bank_account**](docs/FundingApi.md#get_bank_account) | **GET** /bank_accounts/{bank_account_id} | 
*Wealthsimple::FundingApi* | [**get_deposit**](docs/FundingApi.md#get_deposit) | **GET** /deposits/{deposit_id} | 
*Wealthsimple::FundingApi* | [**get_withdrawal**](docs/FundingApi.md#get_withdrawal) | **GET** /withdrawals/{withdrawal_id} | 
*Wealthsimple::FundingApi* | [**list_bank_accounts**](docs/FundingApi.md#list_bank_accounts) | **GET** /bank_accounts | 
*Wealthsimple::FundingApi* | [**list_deposits**](docs/FundingApi.md#list_deposits) | **GET** /deposits | 
*Wealthsimple::FundingApi* | [**list_withdrawals**](docs/FundingApi.md#list_withdrawals) | **GET** /withdrawals | 
*Wealthsimple::HealthcheckApi* | [**healthcheck**](docs/HealthcheckApi.md#healthcheck) | **GET** /healthcheck | 
*Wealthsimple::InstitutionalTransfersApi* | [**get_account_transfer**](docs/InstitutionalTransfersApi.md#get_account_transfer) | **GET** /institutional_transfers/{institutional_transfer_id} | 
*Wealthsimple::InstitutionalTransfersApi* | [**list_account_transfers**](docs/InstitutionalTransfersApi.md#list_account_transfers) | **GET** /institutional_transfers | 
*Wealthsimple::InstitutionalTransfersApi* | [**list_financial_institutions**](docs/InstitutionalTransfersApi.md#list_financial_institutions) | **GET** /financial_institutions | 
*Wealthsimple::PeopleApi* | [**create_person**](docs/PeopleApi.md#create_person) | **POST** /people | 
*Wealthsimple::PeopleApi* | [**get_person**](docs/PeopleApi.md#get_person) | **GET** /people/{person_id} | 
*Wealthsimple::PeopleApi* | [**list_people**](docs/PeopleApi.md#list_people) | **GET** /people | 
*Wealthsimple::PeopleApi* | [**update_person**](docs/PeopleApi.md#update_person) | **PATCH** /people/{person_id} | 
*Wealthsimple::PositionsApi* | [**list_positions**](docs/PositionsApi.md#list_positions) | **GET** /positions | 
*Wealthsimple::SurveysApi* | [**get_survey**](docs/SurveysApi.md#get_survey) | **GET** /surveys/{survey_id} | 
*Wealthsimple::SurveysApi* | [**list_surveys**](docs/SurveysApi.md#list_surveys) | **GET** /surveys | 
*Wealthsimple::TransactionsApi* | [**list_transactions**](docs/TransactionsApi.md#list_transactions) | **GET** /transactions | 
*Wealthsimple::TrustsApi* | [**create_trust**](docs/TrustsApi.md#create_trust) | **POST** /trusts | 
*Wealthsimple::TrustsApi* | [**get_trust**](docs/TrustsApi.md#get_trust) | **GET** /trusts/{trust_id} | 
*Wealthsimple::TrustsApi* | [**list_trusts**](docs/TrustsApi.md#list_trusts) | **GET** /trusts | 
*Wealthsimple::TrustsApi* | [**update_trust**](docs/TrustsApi.md#update_trust) | **PATCH** /trusts/{trust_id} | 
*Wealthsimple::UsersApi* | [**create_user**](docs/UsersApi.md#create_user) | **POST** /users | 
*Wealthsimple::UsersApi* | [**get_user**](docs/UsersApi.md#get_user) | **GET** /users/{user_id} | 
*Wealthsimple::UsersApi* | [**list_users**](docs/UsersApi.md#list_users) | **GET** /users | 


## Documentation for Models

 - [Wealthsimple::AccountBase](docs/AccountBase.md)
 - [Wealthsimple::AccountCreatedAt](docs/AccountCreatedAt.md)
 - [Wealthsimple::AccountId](docs/AccountId.md)
 - [Wealthsimple::AccountNumber](docs/AccountNumber.md)
 - [Wealthsimple::AccountOwner](docs/AccountOwner.md)
 - [Wealthsimple::AccountOwners](docs/AccountOwners.md)
 - [Wealthsimple::AccountTransfer](docs/AccountTransfer.md)
 - [Wealthsimple::AccountTransferEvent](docs/AccountTransferEvent.md)
 - [Wealthsimple::AccountTransferId](docs/AccountTransferId.md)
 - [Wealthsimple::AccountType](docs/AccountType.md)
 - [Wealthsimple::AccountUpdatedAt](docs/AccountUpdatedAt.md)
 - [Wealthsimple::Address](docs/Address.md)
 - [Wealthsimple::Answer](docs/Answer.md)
 - [Wealthsimple::AnswerHint](docs/AnswerHint.md)
 - [Wealthsimple::AnswerId](docs/AnswerId.md)
 - [Wealthsimple::AnswerOptions](docs/AnswerOptions.md)
 - [Wealthsimple::AnswerUpdates](docs/AnswerUpdates.md)
 - [Wealthsimple::Answers](docs/Answers.md)
 - [Wealthsimple::Assessment](docs/Assessment.md)
 - [Wealthsimple::Asset](docs/Asset.md)
 - [Wealthsimple::BankAccountBase](docs/BankAccountBase.md)
 - [Wealthsimple::BankAccountId](docs/BankAccountId.md)
 - [Wealthsimple::BankAccountType](docs/BankAccountType.md)
 - [Wealthsimple::Citizenship](docs/Citizenship.md)
 - [Wealthsimple::Citizenships](docs/Citizenships.md)
 - [Wealthsimple::ClientBase](docs/ClientBase.md)
 - [Wealthsimple::ClientId](docs/ClientId.md)
 - [Wealthsimple::ClientStatus](docs/ClientStatus.md)
 - [Wealthsimple::ClientType](docs/ClientType.md)
 - [Wealthsimple::CorporationDirectors](docs/CorporationDirectors.md)
 - [Wealthsimple::CorporationId](docs/CorporationId.md)
 - [Wealthsimple::CorporationName](docs/CorporationName.md)
 - [Wealthsimple::CorporationOwner](docs/CorporationOwner.md)
 - [Wealthsimple::CorporationOwnerType](docs/CorporationOwnerType.md)
 - [Wealthsimple::CorporationOwners](docs/CorporationOwners.md)
 - [Wealthsimple::CountryCode](docs/CountryCode.md)
 - [Wealthsimple::CreatedAt](docs/CreatedAt.md)
 - [Wealthsimple::CreatedUpdatedAt](docs/CreatedUpdatedAt.md)
 - [Wealthsimple::Currency](docs/Currency.md)
 - [Wealthsimple::CustomIncrement](docs/CustomIncrement.md)
 - [Wealthsimple::DailyValue](docs/DailyValue.md)
 - [Wealthsimple::Date](docs/Date.md)
 - [Wealthsimple::DateTime](docs/DateTime.md)
 - [Wealthsimple::DebitAccountId](docs/DebitAccountId.md)
 - [Wealthsimple::Dependent](docs/Dependent.md)
 - [Wealthsimple::Dependents](docs/Dependents.md)
 - [Wealthsimple::DocumentBase](docs/DocumentBase.md)
 - [Wealthsimple::DocumentId](docs/DocumentId.md)
 - [Wealthsimple::EffectiveDate](docs/EffectiveDate.md)
 - [Wealthsimple::Email](docs/Email.md)
 - [Wealthsimple::EmailPreferences](docs/EmailPreferences.md)
 - [Wealthsimple::Employment](docs/Employment.md)
 - [Wealthsimple::EmploymentEmployerInfo](docs/EmploymentEmployerInfo.md)
 - [Wealthsimple::EmploymentStatus](docs/EmploymentStatus.md)
 - [Wealthsimple::Error](docs/Error.md)
 - [Wealthsimple::ExternalId](docs/ExternalId.md)
 - [Wealthsimple::FinancialInstitution](docs/FinancialInstitution.md)
 - [Wealthsimple::FinancialInstitutionId](docs/FinancialInstitutionId.md)
 - [Wealthsimple::FinancialInstitutions](docs/FinancialInstitutions.md)
 - [Wealthsimple::FirstName](docs/FirstName.md)
 - [Wealthsimple::FullLegalName](docs/FullLegalName.md)
 - [Wealthsimple::FundsTransferBase](docs/FundsTransferBase.md)
 - [Wealthsimple::FundsTransferEvent](docs/FundsTransferEvent.md)
 - [Wealthsimple::FundsTransferId](docs/FundsTransferId.md)
 - [Wealthsimple::FundsTransferRejectReason](docs/FundsTransferRejectReason.md)
 - [Wealthsimple::FundsTransferScheduleId](docs/FundsTransferScheduleId.md)
 - [Wealthsimple::FundsTransferStatus](docs/FundsTransferStatus.md)
 - [Wealthsimple::FundsTransferType](docs/FundsTransferType.md)
 - [Wealthsimple::Gender](docs/Gender.md)
 - [Wealthsimple::Healthcheck](docs/Healthcheck.md)
 - [Wealthsimple::Insider](docs/Insider.md)
 - [Wealthsimple::Insiders](docs/Insiders.md)
 - [Wealthsimple::Institution](docs/Institution.md)
 - [Wealthsimple::InstitutionId](docs/InstitutionId.md)
 - [Wealthsimple::InstitutionNumber](docs/InstitutionNumber.md)
 - [Wealthsimple::LastName](docs/LastName.md)
 - [Wealthsimple::Locale](docs/Locale.md)
 - [Wealthsimple::MaritalStatus](docs/MaritalStatus.md)
 - [Wealthsimple::MaskedAccountNumber](docs/MaskedAccountNumber.md)
 - [Wealthsimple::MiddleNames](docs/MiddleNames.md)
 - [Wealthsimple::MimeType](docs/MimeType.md)
 - [Wealthsimple::Money](docs/Money.md)
 - [Wealthsimple::Name](docs/Name.md)
 - [Wealthsimple::Paginated](docs/Paginated.md)
 - [Wealthsimple::Password](docs/Password.md)
 - [Wealthsimple::Percent](docs/Percent.md)
 - [Wealthsimple::PersonId](docs/PersonId.md)
 - [Wealthsimple::PhoneNumber](docs/PhoneNumber.md)
 - [Wealthsimple::PhoneNumbers](docs/PhoneNumbers.md)
 - [Wealthsimple::PoliticallyExposedPeople](docs/PoliticallyExposedPeople.md)
 - [Wealthsimple::PoliticallyExposedPerson](docs/PoliticallyExposedPerson.md)
 - [Wealthsimple::Position](docs/Position.md)
 - [Wealthsimple::PositionId](docs/PositionId.md)
 - [Wealthsimple::PreferredFirstName](docs/PreferredFirstName.md)
 - [Wealthsimple::ProcessDate](docs/ProcessDate.md)
 - [Wealthsimple::Province](docs/Province.md)
 - [Wealthsimple::QuestionId](docs/QuestionId.md)
 - [Wealthsimple::RangeLimits](docs/RangeLimits.md)
 - [Wealthsimple::RegulatedPeople](docs/RegulatedPeople.md)
 - [Wealthsimple::RegulatedPerson](docs/RegulatedPerson.md)
 - [Wealthsimple::Relation](docs/Relation.md)
 - [Wealthsimple::SpouseOrCommonLaw](docs/SpouseOrCommonLaw.md)
 - [Wealthsimple::StepType](docs/StepType.md)
 - [Wealthsimple::SurveyBase](docs/SurveyBase.md)
 - [Wealthsimple::SurveyDefinitionId](docs/SurveyDefinitionId.md)
 - [Wealthsimple::SurveyId](docs/SurveyId.md)
 - [Wealthsimple::SurveyQuestion](docs/SurveyQuestion.md)
 - [Wealthsimple::SurveyState](docs/SurveyState.md)
 - [Wealthsimple::SurveyUpdate](docs/SurveyUpdate.md)
 - [Wealthsimple::Tag](docs/Tag.md)
 - [Wealthsimple::Tags](docs/Tags.md)
 - [Wealthsimple::TargetPortfolio](docs/TargetPortfolio.md)
 - [Wealthsimple::TargetPortfolioId](docs/TargetPortfolioId.md)
 - [Wealthsimple::TaxDetail](docs/TaxDetail.md)
 - [Wealthsimple::TaxDetailId](docs/TaxDetailId.md)
 - [Wealthsimple::TaxIdentification](docs/TaxIdentification.md)
 - [Wealthsimple::TaxIdentificationNumbers](docs/TaxIdentificationNumbers.md)
 - [Wealthsimple::Transaction](docs/Transaction.md)
 - [Wealthsimple::TransactionId](docs/TransactionId.md)
 - [Wealthsimple::TransactionType](docs/TransactionType.md)
 - [Wealthsimple::TransitNumber](docs/TransitNumber.md)
 - [Wealthsimple::TrustId](docs/TrustId.md)
 - [Wealthsimple::TrustName](docs/TrustName.md)
 - [Wealthsimple::UpdatedAt](docs/UpdatedAt.md)
 - [Wealthsimple::UserBase](docs/UserBase.md)
 - [Wealthsimple::UserId](docs/UserId.md)
 - [Wealthsimple::VerificationBase](docs/VerificationBase.md)
 - [Wealthsimple::VerificationId](docs/VerificationId.md)
 - [Wealthsimple::VerificationMethod](docs/VerificationMethod.md)
 - [Wealthsimple::VerificationStatus](docs/VerificationStatus.md)
 - [Wealthsimple::WithdrawalReason](docs/WithdrawalReason.md)
 - [Wealthsimple::WithdrawalType](docs/WithdrawalType.md)
 - [Wealthsimple::Account](docs/Account.md)
 - [Wealthsimple::AccountCreatedResponse](docs/AccountCreatedResponse.md)
 - [Wealthsimple::AccountInput](docs/AccountInput.md)
 - [Wealthsimple::AccountTransferWithEvents](docs/AccountTransferWithEvents.md)
 - [Wealthsimple::AccountTransfersPaginated](docs/AccountTransfersPaginated.md)
 - [Wealthsimple::AccountValue](docs/AccountValue.md)
 - [Wealthsimple::AccountsPaginated](docs/AccountsPaginated.md)
 - [Wealthsimple::AdjustedBookValue](docs/AdjustedBookValue.md)
 - [Wealthsimple::AnswerOption](docs/AnswerOption.md)
 - [Wealthsimple::AssessmentPaginated](docs/AssessmentPaginated.md)
 - [Wealthsimple::AveragePrice](docs/AveragePrice.md)
 - [Wealthsimple::BankAccountInput](docs/BankAccountInput.md)
 - [Wealthsimple::BankAccountWithFundableAccounts](docs/BankAccountWithFundableAccounts.md)
 - [Wealthsimple::BankAccountsPaginated](docs/BankAccountsPaginated.md)
 - [Wealthsimple::BookValue](docs/BookValue.md)
 - [Wealthsimple::CompletedAt](docs/CompletedAt.md)
 - [Wealthsimple::ContributionValue](docs/ContributionValue.md)
 - [Wealthsimple::CorporationBase](docs/CorporationBase.md)
 - [Wealthsimple::CorporationsPaginated](docs/CorporationsPaginated.md)
 - [Wealthsimple::DailyValuesPaginated](docs/DailyValuesPaginated.md)
 - [Wealthsimple::DebitAccount](docs/DebitAccount.md)
 - [Wealthsimple::Deposit](docs/Deposit.md)
 - [Wealthsimple::DepositRequest](docs/DepositRequest.md)
 - [Wealthsimple::Deposits](docs/Deposits.md)
 - [Wealthsimple::DepositsPaginated](docs/DepositsPaginated.md)
 - [Wealthsimple::DividendsEarned](docs/DividendsEarned.md)
 - [Wealthsimple::Document](docs/Document.md)
 - [Wealthsimple::DocumentInput](docs/DocumentInput.md)
 - [Wealthsimple::DocumentsPaginated](docs/DocumentsPaginated.md)
 - [Wealthsimple::EquityValue](docs/EquityValue.md)
 - [Wealthsimple::FeesPaid](docs/FeesPaid.md)
 - [Wealthsimple::GrossPosition](docs/GrossPosition.md)
 - [Wealthsimple::MarketPrice](docs/MarketPrice.md)
 - [Wealthsimple::MarketValue](docs/MarketValue.md)
 - [Wealthsimple::NetCash](docs/NetCash.md)
 - [Wealthsimple::NetEarnings](docs/NetEarnings.md)
 - [Wealthsimple::NetLiquidation](docs/NetLiquidation.md)
 - [Wealthsimple::NetLiquidationValue](docs/NetLiquidationValue.md)
 - [Wealthsimple::PeoplePaginated](docs/PeoplePaginated.md)
 - [Wealthsimple::PersonBase](docs/PersonBase.md)
 - [Wealthsimple::PositionMarketPrice](docs/PositionMarketPrice.md)
 - [Wealthsimple::PositionMarketValue](docs/PositionMarketValue.md)
 - [Wealthsimple::PositionsPaginated](docs/PositionsPaginated.md)
 - [Wealthsimple::Survey](docs/Survey.md)
 - [Wealthsimple::SurveyInput](docs/SurveyInput.md)
 - [Wealthsimple::SurveysPaginated](docs/SurveysPaginated.md)
 - [Wealthsimple::TargetPortfolioAllocation](docs/TargetPortfolioAllocation.md)
 - [Wealthsimple::TotalDeposits](docs/TotalDeposits.md)
 - [Wealthsimple::TotalDividends](docs/TotalDividends.md)
 - [Wealthsimple::TotalWithdrawals](docs/TotalWithdrawals.md)
 - [Wealthsimple::TransactionsPaginated](docs/TransactionsPaginated.md)
 - [Wealthsimple::TrustBase](docs/TrustBase.md)
 - [Wealthsimple::TrustsPaginated](docs/TrustsPaginated.md)
 - [Wealthsimple::User](docs/User.md)
 - [Wealthsimple::UserInput](docs/UserInput.md)
 - [Wealthsimple::UserPaginated](docs/UserPaginated.md)
 - [Wealthsimple::Verification](docs/Verification.md)
 - [Wealthsimple::VerificationInput](docs/VerificationInput.md)
 - [Wealthsimple::Withdrawal](docs/Withdrawal.md)
 - [Wealthsimple::WithdrawalRequest](docs/WithdrawalRequest.md)
 - [Wealthsimple::Withdrawals](docs/Withdrawals.md)
 - [Wealthsimple::WithdrawalsPaginated](docs/WithdrawalsPaginated.md)
 - [Wealthsimple::Corporation](docs/Corporation.md)
 - [Wealthsimple::CorporationInput](docs/CorporationInput.md)
 - [Wealthsimple::CorporationUpdate](docs/CorporationUpdate.md)
 - [Wealthsimple::DepositWithEvents](docs/DepositWithEvents.md)
 - [Wealthsimple::Person](docs/Person.md)
 - [Wealthsimple::PersonInput](docs/PersonInput.md)
 - [Wealthsimple::PersonUpdate](docs/PersonUpdate.md)
 - [Wealthsimple::Trust](docs/Trust.md)
 - [Wealthsimple::TrustInput](docs/TrustInput.md)
 - [Wealthsimple::TrustUpdate](docs/TrustUpdate.md)
 - [Wealthsimple::WithdrawalWithEvents](docs/WithdrawalWithEvents.md)


## Documentation for Authorization


### Bearer

- **Type**: API key
- **API key parameter name**: Authorization
- **Location**: HTTP header

