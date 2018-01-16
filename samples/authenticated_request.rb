require "bundler/setup"
require "wealthsimple"
require "pry"
require "dotenv/load"

Wealthsimple.configure do |config|
  config.api_key_prefix['Authorization'] = 'Bearer'
  config.scheme = "https"
  config.host = "api.sandbox.wealthsimple.com"
end

response_body, response_code, response_headers = Wealthsimple::ApiClient.default.call_api("POST", "/oauth/token", {
  body: {
   "client_id": "58a99e4862a1b246a7745523ca230e61dd7feff351056fcb22c73a5d7a2fcd69",
   "grant_type": "password",
   "username": ENV["OAUTH_USERNAME"],
   "password": ENV["OAUTH_PASSWORD"],
   "scope": "read"
 },
 return_type: "String",
})

access_token =
JSON.parse(response_body)["access_token"]

Wealthsimple.configure { |config| config.api_key['Authorization'] = access_token }

api_instance = Wealthsimple::UsersApi.new
result = api_instance.get_user("user-221_1ut5ujy")
p result
