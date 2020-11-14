# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'recruitee/version'
require 'english'

Gem::Specification.new do |gem|
  gem.name                  = 'recruitee'
  gem.version               = Recruitee::VERSION
  gem.required_ruby_version = '>= 2.4.0'
  gem.authors               = ['Mike Swift']
  gem.email                 = ['swift@mlh.io']
  gem.description           = 'Unofficial Recruitee API SDK for Ruby.'
  gem.summary               = gem.description
  gem.homepage              = 'https://github.com/mlh/recruitee-rb'
  gem.license               = 'MIT'

  gem.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'faraday', '~> 1.1.0'
  gem.add_dependency 'faraday_middleware', '~> 1.0.0'

  gem.add_development_dependency 'faker', '~> 2.14.0'
  gem.add_development_dependency 'pry', '~> 0.13.1'
  gem.add_development_dependency 'rake', '~> 13.0.1'
  gem.add_development_dependency 'rspec', '~> 3.10.0'
  gem.add_development_dependency 'rubocop', '~> 1.3.0'
  gem.add_development_dependency 'rubocop-performance', '~> 1.8.1'
  gem.add_development_dependency 'rubocop-rspec', '~> 2.0.0'
  gem.add_development_dependency 'simplecov', '~> 0.19.1'
  gem.add_development_dependency 'webmock', '~> 3.10.0'
end
