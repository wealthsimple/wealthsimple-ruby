require "bundler/setup"
require "wealthsimple"
require "pry"
require "dotenv/load"

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

api_instance = Wealthsimple::UsersApi.new
api_instance.api_client.default_headers.merge!({
  'Authorization' => "Bearer #{access_token}",
})

result = api_instance.get_user("user-221_1ut5ujy")
p result
