# frozen_string_literal: true

# External library dependencies
require "version_gem/ruby"

# RSpec Configs
require "config/byebug"
require "config/rspec/rspec_block_is_expected"
require "config/rspec/rspec_core"
require "config/rspec/version_gem"

require "support/farm_animal"
require "support/zoo_animal"

# Last thing before loading this gem is to setup code coverage
begin
  # This does not require "simplecov", but
  require "kettle-soup-cover"
  #   this next line has a side-effect of running `.simplecov`
  require "simplecov" if defined?(Kettle::Soup::Cover) && Kettle::Soup::Cover::DO_COV
rescue LoadError
  nil
end

require "anonymous_active_record"
