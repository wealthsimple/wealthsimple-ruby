require 'bundler/setup'
require 'wealthsimple'
require 'pry'
require 'dotenv/load'

Wealthsimple.configure do |config|
  config.env = :sandbox
  config.api_version = :v1
  config.client_id = '58a99e4862a1b246a7745523ca230e61dd7feff351056fcb22c73a5d7a2fcd69'
  config.client_secret = '3f3741cfad562a3d29d2b1835efed25e55d82f062fb4b53178e9679d9f248f20'
  config.redirect_uri = 'urn:ietf:wg:oauth:2.0:oob'
end

if ENV['AUTHORIZATION_CODE']
  Wealthsimple.get_token ENV['AUTHORIZATION_CODE']
elsif ENV['REFRESH_TOKEN']
  Wealthsimple.auth = ENV['REFRESH_TOKEN']
else
  puts "Visit this URL in your browser:\n\n#{Wealthsimple.authorize_url}\n\n"
  print 'What is the authorization code: '
  code = gets.strip
  Wealthsimple.get_token code
end

user = Wealthsimple.get("/users/#{Wealthsimple.user_id}")
pp user.resource
