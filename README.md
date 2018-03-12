# wealthsimple [![CircleCI](https://circleci.com/gh/wealthsimple/wealthsimple-ruby.svg?style=svg&circle-token=b94b7527d2ba8159eac856f679d7b7bf2fbea7be)](https://circleci.com/gh/wealthsimple/wealthsimple-ruby)

A Ruby client for the [Wealthsimple API](https://developers.wealthsimple.com/).

### Installation

Add the following to your `Gemfile` and run `bundle install`:

```ruby
# TODO: Publish to rubygems.org once code is finalized
gem 'wealthsimple', git: 'https://github.com/wealthsimple/wealthsimple-ruby.git'
```

### Example usage

See [samples directory](./samples) for a wide range of samples, or see the basic example below:

```ruby
Wealthsimple.configure do |config|
  config.env = :sandbox
  config.api_version = :v1
  config.client_id = "<oauth_client_id>"

  # Optional: Depending on grant_type may or may not be needed:
  config.client_secret = "<oauth_client_secret>"

  # Optional: If available, you can optionally specify a previous auth response
  # so that the user does not have to login again:
  config.auth = { ...prior server response... }
end

health = Wealthsimple.get("/healthcheck")
pp health.resource

auth = Wealthsimple.authenticate({
  grant_type: "password",
  scope: "read write",
  username: "peter@example.com",
  password: "abc123$",
})
pp auth.resource

user = Wealthsimple.get("/users/#{auth.resource.resource_owner_id}")
pp user.resource
```
