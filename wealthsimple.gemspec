# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "wealthsimple/version"

Gem::Specification.new do |s|
  s.name        = "wealthsimple"
  s.version     = Wealthsimple::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Swagger-Codegen"]
  s.email       = [""]
  s.homepage    = "https://github.com/wealthsimple/wealthsimple-ruby"
  s.summary     = "Wealthsimple API client rubygem"
  s.description = "Client for interacting with the Wealthsimple Public API"
  s.license     = "MIT"
  s.required_ruby_version = ">= 1.9"

  s.add_runtime_dependency 'typhoeus', '~> 1.0', '>= 1.0.1'
  s.add_runtime_dependency 'json', '~> 2.1', '>= 2.1.0'

  s.add_development_dependency 'rspec', '~> 3.6', '>= 3.6.0'
  s.add_development_dependency 'vcr', '~> 3.0', '>= 3.0.1'
  s.add_development_dependency 'webmock', '~> 1.24', '>= 1.24.3'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'dotenv'

  s.files         = `find *`.split("\n").uniq.sort.select{|f| !f.empty? }
  s.test_files    = `find spec/*`.split("\n")
  s.executables   = []
  s.require_paths = ["lib"]
end
