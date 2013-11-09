# -*- encoding: utf-8 -*-
require File.expand_path('../lib/big_decimal_helper/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Sam Livingston-Gray"]
  gem.email         = ["sam.livingstongray@livingsocial.com"]
  gem.description   = %q{Helpers for working with BigDecimals in Rails apps}
  gem.summary       = %q{Defines a #to_bd conversion protocol to ease typing, and provides an ActiveRecord macro to facilitate presentation of float fields as BigDecimal.}
  gem.homepage      = "https://github.com/livingsocial/big_decimal_helper"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "big_decimal_helper"
  gem.require_paths = ["lib"]
  gem.version       = BigDecimalHelper::VERSION

  gem.add_development_dependency 'rake', '~> 0.9.2.2'
  gem.add_development_dependency 'rspec', '~> 2.11.0'
end
