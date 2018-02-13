# wealthsimple [![CircleCI](https://circleci.com/gh/wealthsimple/wealthsimple-ruby.svg?style=svg&circle-token=b94b7527d2ba8159eac856f679d7b7bf2fbea7be)](https://circleci.com/gh/wealthsimple/wealthsimple-ruby)

Wealthsimple - the Ruby gem for the Wealthsimple API

```ruby
Wealthsimple.configure do |config|
  config.env = :sandbox
  config.api_version = :v1
  config.client_id = "58a99e4862a1b246a7745523ca230e61dd7feff351056fcb22c73a5d7a2fcd69"
end

auth = Wealthsimple.authenticate({
  "grant_type": "password",
  "scope": "read write",
  "username": "peter@example.com",
  "password": "abc123$",
})
pp auth.resource

user = Wealthsimple.get("/users/#{auth.resource.resource_owner_id}")
pp user.resource
```
