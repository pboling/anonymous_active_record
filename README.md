# AnonymousActiveRecord

The gem was inspired by, the [Wolverine project](https://github.com/mcary/wolverine), which [implemented a clever workaround](https://github.com/mcary/wolverine/commit/fa27fa2cc485b2fa83d71b2045ba5a0a069dba75) to the official non-support of [anonymous classes by ActiveRecord](https://github.com/rails/rails/issues/8934).

Warning: Use of this gem is a **security risk**.  It is intended for use in a test suite, or other non-critical environment.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'anonymous_active_record'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install anonymous_active_record

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pboling/anonymous_active_record. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the AnonymousActiveRecord project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/pboling/anonymous_active_record/blob/master/CODE_OF_CONDUCT.md).
