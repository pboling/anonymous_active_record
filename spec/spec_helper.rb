require 'bundler/setup'

require 'byebug' if RbConfig::CONFIG['RUBY_INSTALL_NAME'] == 'ruby'

require 'simplecov'
SimpleCov.start

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
