module Wealthsimple
  def self.authorize_url(params = {})
    oauth_client.auth_code.authorize_url({ redirect_uri: config.redirect_uri }.merge(params))
  end

  def self.get_token(token, redirect_uri = nil)
    config.auth = oauth_client.auth_code.get_token(token, redirect_uri: redirect_uri || config.redirect_uri)
  end

  def self.get_application_token(params = {})
    access_token = oauth_client.client_credentials.get_token(params)
    # abuse OAuth2 gem a bit, since we can't tell the context of how it was
    # obtained and need to "refresh" client credentials automatically
    access_token.instance_variable_get(:@params).merge!(_client_credentials: true, _params: params)
    config.auth = access_token
  end

  def self.user_id
    auth['resource_owner_id']
  end

  def self.client_id
    auth['client_canonical_id']
  end

  def self.auth
    raise AuthenticationError, 'Not authenticated' unless config.auth
    if config.auth.expired?
      return config.auth = config.auth.refresh! if config.auth.refresh_token
      return get_application_token(config.auth[:_params]) if config.auth[:_client_credentials]
      raise AuthenticationError, 'Access token expired'
    end
    config.auth
  end

  def self.auth=(auth_or_refresh_token)
    case auth_or_refresh_token
    when OAuth2::AccessToken
      config.auth = auth_or_refresh_token
    when Hash
      config.auth = OAuth2::AccessToken.from_hash(
        oauth_client,
        auth_or_refresh_token
      )
    when String
      config.auth = OAuth2::AccessToken.from_hash(
        oauth_client,
        refresh_token: auth_or_refresh_token
      ).refresh!
    else
      raise AuthenticationError, "Unknown auth value: #{auth_or_refresh_token}"
    end
    config.auth
  end

  def self.oauth_client
    Wealthsimple.config.validate!
    @oauth_client ||= OAuth2::Client.new(
      Wealthsimple.config.client_id,
      Wealthsimple.config.client_secret,
      site: api_base_url,
      authorize_url: "#{site_base_url}/authorize",
      token_url: "#{api_base_url}/v1/oauth/token"
    )
  end

  def self.api_base_url
    Wealthsimple.config.validate!
    "https://api.#{Wealthsimple.config.env}.wealthsimple.com"
  end

  def self.site_base_url
    Wealthsimple.config.validate!
    Wealthsimple.config.env == 'production' ? 'https://my.wealthsimple.com' : 'https://staging.wealthsimple.com'
  end
end
