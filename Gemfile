# frozen_string_literal: true

# This Gemfile copies liberally from https://github.com/rspec/rspec-core/blob/main/Gemfile
source 'https://rubygems.org'

# Specify your gem's dependencies in rspec-pending_for.gemspec
gemspec

ruby_version = Gem::Version.new(RUBY_VERSION)

gem 'yard', '~> 0.9.24', :require => false

### deps for rdoc.info
group :documentation do
  gem 'github-markup', :platform => :mri
  gem 'redcarpet', :platform => :mri
end

group :development, :test do
  gem 'byebug', :platform => :mri
  gem 'pry', :platform => :mri
  gem 'pry-byebug', :platform => :mri
  gem 'growl'
  gem 'guard'
  gem 'guard-bundler'
  gem 'guard-rspec'
  gem 'rb-fsevent'
end

group :test do
  # No need to run rubocop or simplecov on earlier versions
  if ruby_version >= Gem::Version.new('2.7')
    gem 'rubocop', '~> 1.9', :platform => :mri
    gem 'rubocop-md', :platform => :mri
    gem 'rubocop-minitest', :platform => :mri
    gem 'rubocop-packaging', :platform => :mri
    gem 'rubocop-rake', :platform => :mri
    gem 'rubocop-rspec', :platform => :mri
    gem 'simplecov', :platform => :mri
  end

  gem 'test-unit', '>= 3.0'
end

