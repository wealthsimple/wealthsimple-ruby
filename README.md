# wealthsimple

Wealthsimple - the Ruby gem for the Wealthsimple API

# Introduction  Welcome to the Wealthsimple API reference! Wealthsimple API provides the basic building blocks for creating and funding investment accounts, as well as retrieving account values and transaction data.  The API is built around REST conventions and is designed to have predictable, resource-oriented endpoints. Keep reading below for more information on each specific call.  *Note:*  - *The API is currently in the **Request For Comments (RFC)** phase and is not yet ready for public consumption. Many endpoints have not yet been implemented and will return 501 Not Yet Implemented status code.* - *The API is currently focused on **read-only operations**. We will eventually expand it to allow for creating/updating/deleting resources.*  # API hosts  ``` https://api.sandbox.wealthsimple.com (Sandbox) https://api.production.wealthsimple.com (Production) ```  The Sandbox environment is unrestricted and should be used for all testing. When you’re getting ready to launch into Production, please request Production API access by reaching out to <a href=\"mailto:api-support@wealthsimple.com\">API support</a>.  # Authentication  All resources within the API require authentication via standard OAuth 2 grant flows.  The Wealthsimple API supports `client_credentials`, `authorization_code`, and `password` grant types. Using `password` *is strongly discouraged* and should be reserved for special circumstances such as creating a new user & immediately authenticating as them.  More information about OAuth 2 grant flows can be found in [Section 4 of the OAuth 2 RFC](https://tools.ietf.org/html/rfc6749#section-4).  ## Userless/Application-only Authentication  For all non-resource owner specific endpoints, where you do not need to act on user's behalf, you can choose to authenticate only using your application credentials.  ### Request an access token  ```json POST https://api.sandbox.wealthsimple.com/v1/oauth/token {   \"client_id\": \"YOUR-CLIENT-ID\",   \"client_secret\": \"YOUR-CLIENT-SECRET\",   \"grant_type\": \"client_credentials\" } ``` We also support client application authentication via the Authorization header. The format is HTTP Basic authentication, with the value being a base64 encoding of YOUR-CLIENT-ID:YOUR-CLIENT-SECRET.  ``` POST https://api.sandbox.wealthsimple.com/v1/oauth/token Authorization: Basic czZCaGRSa3F0MzpnWDFmQmF0M2JW Content-Type: application/x-www-form-urlencoded ```  ### Example response  ```json {   \"access_token\": \"de6780bc506a0446309bd9362820ba8aed28aa506c71eedbe1c5c4f9dd350e54\",   \"token_type\": \"bearer\",   \"expires_in\": 7200,   \"created_at\": 1500123132 } ```   ### Using the token You can now access protected, anonymous/userless level API endpoints by passing the token in the headers like so:  ```json Headers: Authroization: Bearer ACCESS-TOKEN  ```  ## Authenticating as a User in your Application (Resource Owner)  For any action where you need to act on a user's behalf you can go through the `authorization_code` or `password` grant flow to obtain an access token associated with a resource owner. Most of our endpoints are designed to be called by a user.  While the password grant flow is supported, it is recommended you authenticate using `authorization_code`. If you must use password **we strongly discourage you storing the user's password, even if encrypted.** There are severe security implications by doing so.  ### Access Token via User Authorization  #### Obtain User Authorization Approval  Your OAuth application must redirect the user to the authorization endpoint. It will inform the user your application wishes to gain access to their account. If they approve access, the user will be redirected to your application's `YOUR-CALLBACK-URI` with the authorization code.  The `YOUR-CALLBACK-URI` for your application is defined ahead of time when your credentials were issued and the request's `redirect_uri` must match what's been configured.  *Note: If a user has previously authorized your application, the prompt will be skipped and the user is redirected with the code automatically.*  Below is the URL your application must direct the user to:  ``` GET https://staging.wealthsimple.com/authorize?client_id=YOUR-CLIENT-ID     &redirect_uri=YOUR-CALLBACK-URI     &state=YOUR-CSRF-TOKEN     &response_type=code ```  *Note: For production, the URL is `https://my.wealthsimple.com/authorize`*  The `state` parameter is optional but recommended to guard against CSRF attacks. It is a random value chosen by your application to maintain state between the request and callback. It ensures the callback the application receives is the one initiated by your request.  ##### Example Response  User is presented our authorization page for approval. Since we use a single-page application, it will redirect to where the app lives:  ``` HTTP/1.1 302 Found Location: https://staging.wealthsimple.com/app/authorize?client_id=YOUR-CLIENT-ID     &redirect_uri=YOUR-CALLBACK-URI     &state=YOUR-CSRF-TOKEN     &response_type=code ```  If they have an active Wealthsimple session, they'll be displayed the prompt otherwise they'll be presented with our login page first.  Once they approve access they will be redirected back to your app:  ``` HTTP/1.1 302 Found Location: YOUR-CALLBACK-URI?code=6309bd71eedaa59362820babc506a0448aed28678006cdebe1c5c4f9dd350e54&state=YOUR-CSRF-TOKEN ```  ##### Example Response (Previously Approved)  User is immediately redirected back to your app, no prompt required, no single-page application loading.  ``` HTTP/1.1 302 Found Location: YOUR-CALLBACK-URI?code=6309bd71eedaa59362820babc506a0448aed28678006cdebe1c5c4f9dd350e54&state=YOUR-CSRF-TOKEN ```  ##### Example Response (User Denies Access)  The API will still redirect to your application, but with `error` set. You can use this to gracefully inform the user why you need authorization:  ``` HTTP/1.1 302 Found Location: YOUR-CALLBACK-URI?error=access_denied&error_description=The+resource+owner+or+authorization+server+denied+the+request.&state=1234 ```  #### Exchange Authorization Code for Access Token  The application, upon receiving the authorization code from the callback in the authorization step, should post to the token endpoint to exchange it for a long-lived access token:  ``` POST https://api.sandbox.wealthsimple.com/v1/oauth/token {   \"grant_type\": \"authorization_code\",   \"client_id\": \"YOUR-CLIENT-ID\",   \"client_secret\": \"YOUR-CLIENT-SECRET\",   \"redirect_uri\": \" YOUR-CALLBACK-URI\",   \"code\": \"6309bd71eedaa59362820babc506a0448aed28678006cdebe1c5c4f9dd350e54\" } ```  The application must authenticate itself with its client secret and pass the `code` parameter received prior.  ##### Example response  ```json {   \"access_token\": \"de6780bc506a0446309bd9362820ba8aed28aa506c71eedbe1c5c4f9dd350e54\",   \"token_type\": \"bearer\",   \"expires_in\": 7200,   \"created_at\": 1500123132 } ```  ### Access Token via User Credentials  ```json POST https://api.sandbox.wealthsimple.com/v1/oauth/token {   \"grant_type\": \"password\",   \"client_id\": \"YOUR-CLIENT-ID\",   \"client_secret\": \"YOUR-CLIENT-SECRET\",   \"username\": \"USERNAME-OF-USER\",   \"password\": \"PASSWORD-OF-USER\" } ```  Or, alternatively you can use HTTP Basic to authenticate your application client as described in the application authentication section:  ```json POST https://api.sandbox.wealthsimple.com/v1/oauth/token Authorization: Basic czZCaGRSa3F0MzpnWDFmQmF0M2JW {   \"grant_type\": \"password\",   \"username\": \"USERNAME-OF-USER\",   \"password\": \"PASSWORD-OF-USER\" } ``` We expect you identify your client application during the password grant flow so we properly enforce which users can authenticate through your application.  #### Example response  ```json {   \"access_token\": \"de6780bc506a0446309bd9362820ba8aed28aa506c71eedbe1c5c4f9dd350e54\",   \"token_type\": \"bearer\",   \"expires_in\": 7200,   \"created_at\": 1500123132 } ```  #### Users with Two-Factor Authentication  Some users may have enabled [Two-Factor Authentication](https://en.wikipedia.org/wiki/Multi-factor_authentication) (2FA) for additional security. We currently support two methods of 2FA: mobile SMS codes and mobile authenticator apps like [Google Authenticator](https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2&hl=en). When authenticating with `password` for a user with 2FA enabled, the endpoint will fail with a *401 Unauthorized* even if you provided the correct username & password. At first glance this appears indistinguishable from a response when an invalid username or password is provided.  In order to maintain OAuth 2 spec, we set the `X-Wealthsimple-OTP` response header so your application can determine if a 2FA code (OTP) is required or if it's just bad credentials. In this scenario your application should prompt the user for their OTP code and replay your original `password` request with the header `X-Wealthsimple-OTP` set to the value of the OTP given by the user.  The structure of the response `X-Wealthsimple-OTP` header is semicolon delimited and is comprised of 3 parts: the message, the 2FA method the user is using, and the last 4 digits of their phone (if applicable). The method can be either `app` or `sms` currently, and you can use this to gracefully tell the user what do to get their OTP code:  ``` X-Wealthsimple-OTP: MESSAGE; method=METHOD; digits=DIGITS ```  * `MESSAGE` will either be `required` if you don't send the OTP code or `invalid` if the OTP provided is bad. * `METHOD` currently will either be `app` for Google Authenticator or `sms` if they're using a mobile device * `DIGITS` will be the user's last 4 digits of their 2FA phone number on file. This field may not be present if user is using `app`.  *__Note:__ If the user is using `sms`, they will automatically receive a text message from us every time your application attempts to authenticate without providing an OTP code.*  #### Authentication Example with Two-Factor Authentication  Request:  ```json POST https://api.sandbox.wealthsimple.com/v1/oauth/token Authorization: Basic czZCaGRSa3F0MzpnWDFmQmF0M2JW {   \"grant_type\": \"password\",   \"username\": \"USERNAME-OF-USER\",   \"password\": \"PASSWORD-OF-USER\" } ```  Response:  ``` HTTP/1.0 401 Unauthorized X-Wealthsimple-OTP: required; method=sms; digits=7375 {     \"error\": \"invalid_grant\",     \"error_description\": \"The provided authorization grant is invalid, expired, revoked, does not match the redirection URI used in the authorization request, or was issued to another client.\" } ```  At this point the user will have received an OTP code on their mobile device which they provide to the application.  Subsequent Request:  ```json POST https://api.sandbox.wealthsimple.com/v1/oauth/token Authorization: Basic czZCaGRSa3F0MzpnWDFmQmF0M2JW X-Wealthsimple-OTP: 682932 {   \"grant_type\": \"password\",   \"username\": \"USERNAME-OF-USER\",   \"password\": \"PASSWORD-OF-USER\" } ```  Subsequent Response:  ```json {   \"access_token\": \"de6780bc506a0446309bd9362820ba8aed28aa506c71eedbe1c5c4f9dd350e54\",   \"token_type\": \"bearer\",   \"expires_in\": 7200,   \"created_at\": 1500123132 } ```  ### Using the Access Token  You can now access protected, \"user-centric\" API endpoints by passing the token in the Authorization header:  ``` Authorization: Bearer ACCESS-TOKEN ```  ### Viewing your Authentication Info  We have an endpoint you can call should your application need more information about the authentication its been granted. This can especially be the case for when authenticated as a resource owner, as they have a unique identifier you can use.  ``` GET https://api.sandbox.wealthsimple.com/v1/oauth/token/info Authorization: Bearer ACCESS-TOKEN ```  If you authenticated as your application, and not as a user, then `resource_owner_id` will be set to null.  #### Example response  ```json {     \"token\": {         \"id\": 4655,         \"resource_owner_id\": \"user-n5vhwz7ti9q\",         \"application_id\": 24,         \"token\": \"de6780bc506a0446309bd9362820ba8aed28aa506c71eedbe1c5c4f9dd350e54\",         \"refresh_token\": null,         \"expires_in\": 7200,         \"revoked_at\": null,         \"created_at\": \"2017-08-17T21:33:51.884Z\",         \"scopes\": \"\",         \"previous_refresh_token\": \"\",         \"application_family_id\": \"dunder-mifflin\"     } } ```  # Pagination  Many of the `GET` APIs that return a collection of results are paginated because the size of result-set can be prohibitively large.  These APIs take a `first_result` and `max_results` as query parameters.  The `first_result` is an index offset and the `max_results` determines the upper limit on how many results will be returned per call.  If the API has additional query parameters it is important to resend them on subsequent page requests otherwise the result set will differ.  That being said, some queries are inherently unstable.  For example, if you query for Clients and the sort order is descending, if the `creation_date` parameter is not fixed as new Clients are added to the system, it will push older clients into subsequent pages.  # Errors  Wealthsimple uses conventional HTTP response codes to indicate the success or failure of an API request. In general, codes in the 2xx range indicate success, codes in the 4xx range indicate an error that failed given the information provided (e.g., a required parameter was omitted, missing additional information, etc.), and codes in the 5xx range indicate an error with Wealthsimple's servers.  Not all errors map cleanly onto HTTP response codes, however. When a request is valid but does not complete successfully, we return a 402 error code and will include a code in the error for you to understand why.  Refer to the list of codes in the documentation. 

This SDK is automatically generated by the [Swagger Codegen](https://github.com/swagger-api/swagger-codegen) project:

- API version: 1.0
- Package version: 1.0.0
- Build package: io.swagger.codegen.languages.RubyClientCodegen

## Installation

### Build a gem

To build the Ruby code into a gem:

```shell
gem build wealthsimple.gemspec
```

Then either install the gem locally:

```shell
gem install ./wealthsimple-1.0.0.gem
```
(for development, run `gem install --dev ./wealthsimple-1.0.0.gem` to install the development dependencies)

or publish the gem to a gem hosting service, e.g. [RubyGems](https://rubygems.org/).

Finally add this to the Gemfile:

    gem 'wealthsimple', '~> 1.0.0'

### Install from Git

If the Ruby gem is hosted at a git repository: https://github.com/GIT_USER_ID/GIT_REPO_ID, then add the following in the Gemfile:

    gem 'wealthsimple', :git => 'https://github.com/GIT_USER_ID/GIT_REPO_ID.git'

### Include the Ruby code directly

Include the Ruby code directly using `-I` as follows:

```shell
ruby -Ilib script.rb
```

## Getting Started

Please follow the [installation](#installation) procedure and then run the following code:
```ruby
# Load the gem
require 'wealthsimple'

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
 - [Wealthsimple::AccountId](docs/AccountId.md)
 - [Wealthsimple::AccountNumber](docs/AccountNumber.md)
 - [Wealthsimple::AccountTransfer](docs/AccountTransfer.md)
 - [Wealthsimple::AccountTransferEvent](docs/AccountTransferEvent.md)
 - [Wealthsimple::AccountTransferId](docs/AccountTransferId.md)
 - [Wealthsimple::AccountType](docs/AccountType.md)
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
 - [Wealthsimple::MarketPrice](docs/MarketPrice.md)
 - [Wealthsimple::MarketValue](docs/MarketValue.md)
 - [Wealthsimple::NetCash](docs/NetCash.md)
 - [Wealthsimple::NetEarnings](docs/NetEarnings.md)
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
 - [Wealthsimple::TotalDividends](docs/TotalDividends.md)
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

 All endpoints do not require authorization.

