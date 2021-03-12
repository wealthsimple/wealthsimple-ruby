# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "wealthsimple/version"

Gem::Specification.new do |s|
  raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.' unless s.respond_to?(:metadata)

  s.name        = "wealthsimple"
  s.version     = Wealthsimple::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = [""]
  s.email       = [""]
  s.homepage    = "https://github.com/wealthsimple/wealthsimple-ruby"
  s.summary     = "A Ruby client for the Wealthsimple API"
  s.description = "Client for interacting with the Wealthsimple API"
  s.license     = "MIT"
  s.required_ruby_version = ">= 2.3"

  s.files         = `find *`.split("\n").uniq.sort.select{|f| !f.empty? }
  s.test_files    = `find spec/*`.split("\n")
  s.executables   = []
  s.require_paths = ["lib"]
  s.metadata['allowed_push_host'] = "https://nexus.iad.w10external.com/repository/gems-private"

  s.add_runtime_dependency "faraday"
  s.add_runtime_dependency "json"
  s.add_runtime_dependency "activesupport"
  s.add_runtime_dependency "recursive-open-struct"
  s.add_runtime_dependency "rack", ">= 1.1" # used for query string parsing

  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-its"
  s.add_development_dependency "rspec-collection_matchers"
  s.add_development_dependency "webmock"
  s.add_development_dependency "pry"
  s.add_development_dependency "dotenv"
  s.add_development_dependency "bundler-audit"
  s.add_development_dependency "ws-gem_publisher", "~> 3"
end
