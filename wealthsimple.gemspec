# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "wealthsimple/version"

Gem::Specification.new do |spec|
  spec.name          = "wealthsimple"
  spec.version       = Wealthsimple::VERSION
  spec.authors       = ["Peter Graham"]
  spec.email         = ["peter@wealthsimple.com"]

  spec.summary       = %q{Wealthsimple rubygem placeholder}
  spec.description   = %q{Wealthsimple rubygem placeholder.}
  spec.homepage      = "https://github.com/wealthsimple/wealthsimple-gem"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
