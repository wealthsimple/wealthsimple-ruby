# wealthsimple [![CircleCI](https://circleci.com/gh/wealthsimple/wealthsimple-ruby.svg?style=svg&circle-token=b94b7527d2ba8159eac856f679d7b7bf2fbea7be)](https://circleci.com/gh/wealthsimple/wealthsimple-ruby)

A Ruby client for the [Wealthsimple API](https://developers.wealthsimple.com/).

### Installation

Add the following to your `Gemfile` and run `bundle install`:

```ruby
# TODO: Publish to rubygems.org once code is finalized
gem 'wealthsimple', git: 'https://github.com/wealthsimple/wealthsimple-ruby.git'
```

### Authentication

The Wealthsimple API uses OAuth 2.0 for authentication. Presently this gem only supports Client Credentials and Authorization Code flows.

#### Authorization Code

To generate the authorization URL to display to or redirect your users:

```ruby
Wealthsimple.authorize_url
# => "https://staging.wealthsimple.com/app/authorize?client_id=58a99e4862a1b246a7745523ca230e61dd7feff351056fcb22c73a5d7a2fcd69&redirect_uri=urn:ietf:wg:oauth:2.0:oob&response_type=code"
```

You can also pass any valid OAuth params like `state` or `scope`:

```ruby
Wealthsimple.authorize_url(state: 123, scope: 'read write')
# => "https://staging.wealthsimple.com/app/authorize?client_id=58a99e4862a1b246a7745523ca230e61dd7feff351056fcb22c73a5d7a2fcd69&redirect_uri=urn:ietf:wg:oauth:2.0:oob&response_type=code&state=123&scope=read%20write"
```

To obtain access token (and refresh token if applicable) after the redirect back to your application:

```ruby
code = params[:code] # The authorization URL will have called back to your app with this
Wealthsimple.get_token(code)
=> #<OAuth2::AccessToken:0x00007ff2d50c9070 ...>
```

You can save this access token object in whichever way you like and restore it to continue a user session:

```ruby
save_context_to_db(my_user_id, Wealthsimple.auth.to_hash)
=> true

# wait 10 hours

Wealthsimple.auth = load_context_to_db(my_user_id)
=> #<OAuth2::AccessToken:0x00007ff2d50c9070 ...>
```

If you're allowed to use refresh tokens the gem will refresh its access tokens as needed.

### Application Credentials

You can authenticate as your application instead of any particular user.

```ruby
Wealthsimple.get_application_token
=> #<OAuth2::AccessToken:0x00007ff2d50c9070 ...>
```

You can also pass any valid OAuth params like `scope`:

```ruby
Wealthsimple.get_application_token(scope: 'read write')
=> #<OAuth2::AccessToken:0x00007ff2d50c9070 ...>
```

### Example usage

See [samples directory](./samples) for a wide range of samples, or see the basic example below:

```ruby
Wealthsimple.configure do |config|
  config.env = :sandbox
  config.api_version = :v1
  config.client_id = "<oauth_client_id>"
  config.client_secret = "<oauth_client_secret>"

  # Optional: You can pass it to Wealthsimple.authorize_url as a param and Wealthsimple.get_token as a second parameter instead.
  config.redirect_uri = "<oauth_client_redirect_uri>"
end

url = Wealthsimple.authorize_url(scope: 'read write')
pp url # display this URL to your user

# Have a callback controller parse the authorization code
Wealthsimple.get_token(params[:code])

health = Wealthsimple.get("/healthcheck")
pp health.resource

user = Wealthsimple.get("/users/#{Wealthsimple.user_id}")
pp user.resource
```
