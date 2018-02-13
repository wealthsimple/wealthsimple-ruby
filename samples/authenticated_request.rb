require "bundler/setup"
require "wealthsimple"
require "pry"
require "dotenv/load"

Wealthsimple.configure do |config|
  config.env = :sandbox
  config.api_version = :v1
  config.client_id = "58a99e4862a1b246a7745523ca230e61dd7feff351056fcb22c73a5d7a2fcd69"
end


response = Wealthsimple.post("/oauth/token", {
  body: {
    "client_id": Wealthsimple.config.client_id,
    "grant_type": "password",
    "username": ENV["OAUTH_USERNAME"],
    "password": ENV["OAUTH_PASSWORD"],
    "scope": "read"
  }
})

pp response.resource

access_token = response.resource.access_token

user = Wealthsimple.get("/users/#{response.resource.resource_owner_id}", headers: { Authorization: "Bearer #{access_token}" })
pp user.resource

#
#
# access_token =
# JSON.parse(response_body)["access_token"]
#
# Wealthsimple.configure { |config| config.api_key['Authorization'] = access_token }
#
# api_instance = Wealthsimple::UsersApi.new
# result = api_instance.get_user("user-221_1ut5ujy")
# p result
