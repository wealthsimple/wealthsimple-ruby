=begin
#Wealthsimple API

## Introduction  Welcome to the Wealthsimple API reference! Wealthsimple API provides the basic building blocks for creating and funding investment accounts, as well as retrieving account values and transaction data.  The API is built around REST conventions and is designed to have predictable, resource-oriented endpoints. Keep reading below for more information on each specific call.  *Note:*  - *The API is currently in the **Request For Comments (RFC)** phase and is not yet ready for public consumption. Many endpoints have not yet been implemented and will return 501 Not Yet Implemented status code.* - *The API is currently focused on **read-only operations**. We will eventually expand it to allow for creating/updating/deleting resources.*  # API hosts  ``` https://api.sandbox.wealthsimple.com (Sandbox) https://api.production.wealthsimple.com (Production) ```  The Sandbox environment is unrestricted and should be used for all testing. When you’re getting ready to launch into Production, please request Production API access by reaching out to <a href=\"mailto:api-support@wealthsimple.com\">API support</a>.  # Authentication  All resources within the API require authentication via standard OAuth 2 grant flows.  The Wealthsimple API supports `client_credentials`, `authorization_code`, and `password` grant types. Using `password` *is strongly discouraged* and should be reserved for special circumstances such as creating a new user & immediately authenticating as them.  More information about OAuth 2 grant flows can be found in [Section 4 of the OAuth 2 RFC](https://tools.ietf.org/html/rfc6749#section-4).  ## Userless/Application-only Authentication  For all non-resource owner specific endpoints, where you do not need to act on user's behalf, you can choose to authenticate only using your application credentials.  ### Request an access token  ```json POST https://api.sandbox.wealthsimple.com/v1/oauth/token {   \"client_id\": \"YOUR-CLIENT-ID\",   \"client_secret\": \"YOUR-CLIENT-SECRET\",   \"grant_type\": \"client_credentials\" } ``` We also support client application authentication via the Authorization header. The format is HTTP Basic authentication, with the value being a base64 encoding of YOUR-CLIENT-ID:YOUR-CLIENT-SECRET.  ``` POST https://api.sandbox.wealthsimple.com/v1/oauth/token Authorization: Basic czZCaGRSa3F0MzpnWDFmQmF0M2JW Content-Type: application/x-www-form-urlencoded ```  ### Example response  ```json {   \"access_token\": \"de6780bc506a0446309bd9362820ba8aed28aa506c71eedbe1c5c4f9dd350e54\",   \"token_type\": \"bearer\",   \"expires_in\": 7200,   \"created_at\": 1500123132 } ```   ### Using the token You can now access protected, anonymous/userless level API endpoints by passing the token in the headers like so:  ```json Headers: Authroization: Bearer ACCESS-TOKEN  ```  ## Authenticating as a User in your Application (Resource Owner)  For any action where you need to act on a user's behalf you can go through the `authorization_code` or `password` grant flow to obtain an access token associated with a resource owner. Most of our endpoints are designed to be called by a user.  While the password grant flow is supported, it is recommended you authenticate using `authorization_code`. If you must use password **we strongly discourage you storing the user's password, even if encrypted.** There are severe security implications by doing so.  ### Access Token via User Authorization  #### Obtain User Authorization Approval  Your OAuth application must redirect the user to the authorization endpoint. It will inform the user your application wishes to gain access to their account. If they approve access, the user will be redirected to your application's `YOUR-CALLBACK-URI` with the authorization code.  The `YOUR-CALLBACK-URI` for your application is defined ahead of time when your credentials were issued and the request's `redirect_uri` must match what's been configured.  *Note: If a user has previously authorized your application, the prompt will be skipped and the user is redirected with the code automatically.*  Below is the URL your application must direct the user to:  ``` GET https://staging.wealthsimple.com/authorize?client_id=YOUR-CLIENT-ID     &redirect_uri=YOUR-CALLBACK-URI     &state=YOUR-CSRF-TOKEN     &response_type=code ```  *Note: For production, the URL is `https://my.wealthsimple.com/authorize`*  The `state` parameter is optional but recommended to guard against CSRF attacks. It is a random value chosen by your application to maintain state between the request and callback. It ensures the callback the application receives is the one initiated by your request.  ##### Example Response  User is presented our authorization page for approval. Since we use a single-page application, it will redirect to where the app lives:  ``` HTTP/1.1 302 Found Location: https://staging.wealthsimple.com/app/authorize?client_id=YOUR-CLIENT-ID     &redirect_uri=YOUR-CALLBACK-URI     &state=YOUR-CSRF-TOKEN     &response_type=code ```  If they have an active Wealthsimple session, they'll be displayed the prompt otherwise they'll be presented with our login page first.  Once they approve access they will be redirected back to your app:  ``` HTTP/1.1 302 Found Location: YOUR-CALLBACK-URI?code=6309bd71eedaa59362820babc506a0448aed28678006cdebe1c5c4f9dd350e54&state=YOUR-CSRF-TOKEN ```  ##### Example Response (Previously Approved)  User is immediately redirected back to your app, no prompt required, no single-page application loading.  ``` HTTP/1.1 302 Found Location: YOUR-CALLBACK-URI?code=6309bd71eedaa59362820babc506a0448aed28678006cdebe1c5c4f9dd350e54&state=YOUR-CSRF-TOKEN ```  ##### Example Response (User Denies Access)  The API will still redirect to your application, but with `error` set. You can use this to gracefully inform the user why you need authorization:  ``` HTTP/1.1 302 Found Location: YOUR-CALLBACK-URI?error=access_denied&error_description=The+resource+owner+or+authorization+server+denied+the+request.&state=1234 ```  #### Exchange Authorization Code for Access Token  The application, upon receiving the authorization code from the callback in the authorization step, should post to the token endpoint to exchange it for a long-lived access token:  ``` POST https://api.sandbox.wealthsimple.com/v1/oauth/token {   \"grant_type\": \"authorization_code\",   \"client_id\": \"YOUR-CLIENT-ID\",   \"client_secret\": \"YOUR-CLIENT-SECRET\",   \"redirect_uri\": \" YOUR-CALLBACK-URI\",   \"code\": \"6309bd71eedaa59362820babc506a0448aed28678006cdebe1c5c4f9dd350e54\" } ```  The application must authenticate itself with its client secret and pass the `code` parameter received prior.  ##### Example response  ```json {   \"access_token\": \"de6780bc506a0446309bd9362820ba8aed28aa506c71eedbe1c5c4f9dd350e54\",   \"token_type\": \"bearer\",   \"expires_in\": 7200,   \"created_at\": 1500123132 } ```  ### Access Token via User Credentials  ```json POST https://api.sandbox.wealthsimple.com/v1/oauth/token {   \"grant_type\": \"password\",   \"client_id\": \"YOUR-CLIENT-ID\",   \"client_secret\": \"YOUR-CLIENT-SECRET\",   \"username\": \"USERNAME-OF-USER\",   \"password\": \"PASSWORD-OF-USER\" } ```  Or, alternatively you can use HTTP Basic to authenticate your application client as described in the application authentication section:  ```json POST https://api.sandbox.wealthsimple.com/v1/oauth/token Authorization: Basic czZCaGRSa3F0MzpnWDFmQmF0M2JW {   \"grant_type\": \"password\",   \"username\": \"USERNAME-OF-USER\",   \"password\": \"PASSWORD-OF-USER\" } ``` We expect you identify your client application during the password grant flow so we properly enforce which users can authenticate through your application.  #### Example response  ```json {   \"access_token\": \"de6780bc506a0446309bd9362820ba8aed28aa506c71eedbe1c5c4f9dd350e54\",   \"token_type\": \"bearer\",   \"expires_in\": 7200,   \"created_at\": 1500123132 } ```  #### Users with Two-Factor Authentication  Some users may have enabled [Two-Factor Authentication](https://en.wikipedia.org/wiki/Multi-factor_authentication) (2FA) for additional security. We currently support two methods of 2FA: mobile SMS codes and mobile authenticator apps like [Google Authenticator](https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2&hl=en). When authenticating with `password` for a user with 2FA enabled, the endpoint will fail with a *401 Unauthorized* even if you provided the correct username & password. At first glance this appears indistinguishable from a response when an invalid username or password is provided.  In order to maintain OAuth 2 spec, we set the `X-Wealthsimple-OTP` response header so your application can determine if a 2FA code (OTP) is required or if it's just bad credentials. In this scenario your application should prompt the user for their OTP code and replay your original `password` request with the header `X-Wealthsimple-OTP` set to the value of the OTP given by the user.  The structure of the response `X-Wealthsimple-OTP` header is semicolon delimited and is comprised of 3 parts: the message, the 2FA method the user is using, and the last 4 digits of their phone (if applicable). The method can be either `app` or `sms` currently, and you can use this to gracefully tell the user what do to get their OTP code:  ``` X-Wealthsimple-OTP: MESSAGE; method=METHOD; digits=DIGITS ```  * `MESSAGE` will either be `required` if you don't send the OTP code or `invalid` if the OTP provided is bad. * `METHOD` currently will either be `app` for Google Authenticator or `sms` if they're using a mobile device * `DIGITS` will be the user's last 4 digits of their 2FA phone number on file. This field may not be present if user is using `app`.  *__Note:__ If the user is using `sms`, they will automatically receive a text message from us every time your application attempts to authenticate without providing an OTP code.*  #### Authentication Example with Two-Factor Authentication  Request:  ```json POST https://api.sandbox.wealthsimple.com/v1/oauth/token Authorization: Basic czZCaGRSa3F0MzpnWDFmQmF0M2JW {   \"grant_type\": \"password\",   \"username\": \"USERNAME-OF-USER\",   \"password\": \"PASSWORD-OF-USER\" } ```  Response:  ``` HTTP/1.0 401 Unauthorized X-Wealthsimple-OTP: required; method=sms; digits=7375 {     \"error\": \"invalid_grant\",     \"error_description\": \"The provided authorization grant is invalid, expired, revoked, does not match the redirection URI used in the authorization request, or was issued to another client.\" } ```  At this point the user will have received an OTP code on their mobile device which they provide to the application.  Subsequent Request:  ```json POST https://api.sandbox.wealthsimple.com/v1/oauth/token Authorization: Basic czZCaGRSa3F0MzpnWDFmQmF0M2JW X-Wealthsimple-OTP: 682932 {   \"grant_type\": \"password\",   \"username\": \"USERNAME-OF-USER\",   \"password\": \"PASSWORD-OF-USER\" } ```  Subsequent Response:  ```json {   \"access_token\": \"de6780bc506a0446309bd9362820ba8aed28aa506c71eedbe1c5c4f9dd350e54\",   \"token_type\": \"bearer\",   \"expires_in\": 7200,   \"created_at\": 1500123132 } ```  ### Using the Access Token  You can now access protected, \"user-centric\" API endpoints by passing the token in the Authorization header:  ``` Authorization: Bearer ACCESS-TOKEN ```  ### Viewing your Authentication Info  We have an endpoint you can call should your application need more information about the authentication its been granted. This can especially be the case for when authenticated as a resource owner, as they have a unique identifier you can use.  ``` GET https://api.sandbox.wealthsimple.com/v1/oauth/token/info Authorization: Bearer ACCESS-TOKEN ```  If you authenticated as your application, and not as a user, then `resource_owner_id` will be set to null.  #### Example response  ```json {     \"token\": {         \"id\": 4655,         \"resource_owner_id\": \"user-n5vhwz7ti9q\",         \"application_id\": 24,         \"token\": \"de6780bc506a0446309bd9362820ba8aed28aa506c71eedbe1c5c4f9dd350e54\",         \"refresh_token\": null,         \"expires_in\": 7200,         \"revoked_at\": null,         \"created_at\": \"2017-08-17T21:33:51.884Z\",         \"scopes\": \"\",         \"previous_refresh_token\": \"\",         \"application_family_id\": \"dunder-mifflin\"     } } ```  # Pagination  Many of the `GET` APIs that return a collection of results are paginated because the size of result-set can be prohibitively large.  These APIs take a `first_result` and `max_results` as query parameters.  The `first_result` is an index offset and the `max_results` determines the upper limit on how many results will be returned per call.  If the API has additional query parameters it is important to resend them on subsequent page requests otherwise the result set will differ.  That being said, some queries are inherently unstable.  For example, if you query for Clients and the sort order is descending, if the `creation_date` parameter is not fixed as new Clients are added to the system, it will push older clients into subsequent pages.  # Errors  Wealthsimple uses conventional HTTP response codes to indicate the success or failure of an API request. In general, codes in the 2xx range indicate success, codes in the 4xx range indicate an error that failed given the information provided (e.g., a required parameter was omitted, missing additional information, etc.), and codes in the 5xx range indicate an error with Wealthsimple's servers.  Not all errors map cleanly onto HTTP response codes, however. When a request is valid but does not complete successfully, we return a 402 error code and will include a code in the error for you to understand why.  Refer to the list of codes in the documentation. 

OpenAPI spec version: 1.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.3.0

=end

require 'spec_helper'
require 'json'
require 'date'

# Unit tests for Wealthsimple::Trust
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'Trust' do
  before do
    # run before each test
    @instance = Wealthsimple::Trust.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of Trust' do
    it 'should create an instance of Trust' do
      expect(@instance).to be_instance_of(Wealthsimple::Trust)
    end
  end
  describe 'test attribute "email"' do
    it 'should work' do
       # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "phone_numbers"' do
    it 'should work' do
       # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "user_id"' do
    it 'should work' do
       # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "external_id"' do
    it 'should work' do
       # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "locale"' do
    it 'should work' do
       # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "mailing_address"' do
    it 'should work' do
       # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "jurisdictions"' do
    it 'should work' do
       # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "tax_identification_number"' do
    it 'should work' do
       # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "name"' do
    it 'should work' do
       # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "created_at"' do
    it 'should work' do
       # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "updated_at"' do
    it 'should work' do
       # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "object"' do
    it 'should work' do
       # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
       #validator = Petstore::EnumTest::EnumAttributeValidator.new('String', ["trust"])
       #validator.allowable_values.each do |value|
       #  expect { @instance.object = value }.not_to raise_error
       #end
    end
  end

  describe 'test attribute "id"' do
    it 'should work' do
       # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end

