# frozen_string_literal: true

require 'bundler/setup'

require 'byebug' if RUBY_ENGINE == 'ruby'

require 'rspec/block_is_expected'

ruby_version = Gem::Version.new(RUBY_VERSION)
require 'simplecov' if ruby_version >= Gem::Version.new('2.7') && RUBY_ENGINE == 'ruby'

require 'anonymous_active_record'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
