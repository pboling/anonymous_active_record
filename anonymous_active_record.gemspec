# frozen_string_literal: true

# Get the GEMFILE_VERSION without *require* "my_gem/version", for code coverage accuracy
# See: https://github.com/simplecov-ruby/simplecov/issues/557#issuecomment-825171399
load "lib/anonymous_active_record/version.rb"
gem_version = AnonymousActiveRecord::Version::VERSION
AnonymousActiveRecord::Version.send(:remove_const, :VERSION)

Gem::Specification.new do |spec|
  spec.name = "anonymous_active_record"
  spec.version = gem_version
  spec.authors = ["Peter Boling"]
  spec.email = ["peter.boling@gmail.com"]

  # See CONTRIBUTING.md
  spec.cert_chain = ["certs/pboling.pem"]
  spec.signing_key = File.expand_path("~/.ssh/gem-private_key.pem") if $PROGRAM_NAME.end_with?("gem")

  spec.summary = "Almost Anonymous ActiveRecord classes"
  spec.description = "Replacement for broken Class.new(ActiveRecord::Base)"
  spec.homepage = "https://github.com/pboling/anonymous_active_record"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.4" # Requirement for Ruby String#capitalize

  spec.files = Dir[
    # Splats (alphabetical)
    "lib/**/*",
    # Files (alphabetical)
    "CHANGELOG.md",
    "LICENSE.txt",
    "README.md",
    "CODE_OF_CONDUCT.md"
  ]
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency("activerecord", ">= 5")
  spec.add_dependency("activesupport", ">= 5")
  spec.add_dependency("version_gem", "~> 1.1", ">= 1.1.4")

  # Documentation
  spec.add_development_dependency("yard", "~> 0.9", ">= 0.9.34")
  spec.add_development_dependency("yard-junk", "~> 0.0.10")

  # Coverage
  spec.add_development_dependency("kettle-soup-cover", "~> 1.0", ">= 1.0.2")

  # Unit Tests
  spec.add_development_dependency("rake", "~> 13")
  spec.add_development_dependency("rspec", "~> 3")
  spec.add_development_dependency("rspec-block_is_expected", "~> 1")
  spec.add_development_dependency("sqlite3", "~> 1")

  # Linting
  spec.add_development_dependency("rubocop-lts", "~> 10.1") # Lint & Style Support for Ruby 2.3+
  spec.add_development_dependency("rubocop-packaging", "~> 0.5", ">=0.5.2")
  spec.add_development_dependency("rubocop-rspec")
  spec.add_development_dependency("standard", ">= 1.40")
end
