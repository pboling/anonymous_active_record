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

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.license       = 'MIT'

  spec.required_ruby_version = '>= 2.4' # Requirement for Ruby String#capitalize

  spec.add_development_dependency 'bundler', '~> 1'
  spec.add_development_dependency 'rake', '~> 12'
  spec.add_development_dependency 'rspec', '~> 3'
  spec.add_development_dependency 'rspec-block_is_expected', '~> 1.0'
  spec.add_development_dependency 'rubocop', '~> 0.60'
  spec.add_development_dependency 'rubocop-rspec', '~> 1.30'
  spec.add_development_dependency 'sqlite3', '~> 1'
  spec.add_dependency 'activerecord', '~> 5'
end
