require "bundler/setup"
require "wealthsimple"
require "pry"
require "dotenv/load"

Wealthsimple.configure do |config|
  config.env = :sandbox
  config.api_version = :v1
  config.client_id = "58a99e4862a1b246a7745523ca230e61dd7feff351056fcb22c73a5d7a2fcd69"
end

auth = Wealthsimple.authenticate({
  "grant_type": "password",
  "username": ENV["EMAIL"],
  "password": ENV["PASSWORD"],
  "scope": "read write",
})

begin
  user = Wealthsimple.get("/users/invalid")
rescue Wealthsimple::ApiError => e
  pp e.status, e.resource.message
  pp e.to_h
end
