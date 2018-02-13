require "bundler/setup"
require "wealthsimple"
require 'rspec'
require 'rspec/collection_matchers'
require 'webmock/rspec'
require 'rspec/its'
require 'pry'

RSpec.configure do |config|
  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:each) do
    Wealthsimple.reset_config!
  end
end

def use_default_config!
  Wealthsimple.configure do |config|
    config.env = :sandbox
    config.api_version = "v1"
    config.client_id = "oauth_client_id"
    config.client_secret = "oauth_client_secret"
  end
end
