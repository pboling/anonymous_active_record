# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'anonymous_active_record/version'

Gem::Specification.new do |spec|
  spec.name          = 'anonymous_active_record'
  spec.version       = AnonymousActiveRecord::VERSION
  spec.authors       = ['Peter Boling']
  spec.email         = ['peter.boling@gmail.com']

  spec.summary       = 'Almost Anonymous ActiveRecord classes'
  spec.description   = 'Replacement for broken Class.new(ActiveRecord::Base)'
  spec.homepage      = 'https://github.com/pboling/anonymous_active_record'

  spec.files = Dir['lib/**/*', 'LICENSE', 'README.md', 'CODE_OF_CONDUCT.md']
  spec.test_files = Dir["spec/**/*"]
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.rdoc_options  = ['--charset=UTF-8']
  spec.license       = 'MIT'

  spec.required_ruby_version = '>= 2.4' # Requirement for Ruby String#capitalize

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake', '~> 13'
  spec.add_development_dependency 'rspec', '~> 3'
  spec.add_development_dependency 'rspec-block_is_expected', '~> 1'
  spec.add_development_dependency 'rubocop', '~> 1.9'
  spec.add_development_dependency 'rubocop-performance'
  spec.add_development_dependency 'rubocop-packaging'
  spec.add_development_dependency 'rubocop-md'
  spec.add_development_dependency 'rubocop-minitest'
  spec.add_development_dependency 'rubocop-rake'
  spec.add_development_dependency 'rubocop-rspec'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'sqlite3', '~> 1'
  spec.add_dependency 'activerecord', '>= 5'
end
