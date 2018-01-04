# AnonymousActiveRecord

This library was 🎩 inspired by 🎩, the [Wolverine project](https://github.com/mcary/wolverine), which [implemented a clever workaround](https://github.com/mcary/wolverine/commit/fa27fa2cc485b2fa83d71b2045ba5a0a069dba75) to the official non-support of [anonymous classes by ActiveRecord](https://github.com/rails/rails/issues/8934).

Warning: Use of this gem is a **security risk**, due to the use of Ruby's `eval`.  It is intended for use in a test suite, or other non-critical environment.

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

Require the library in your `spec_helper` or other test suite boot file.

```ruby
require 'anonymous_active_record'
```

Let's say you want to write specs for a module, `HasBalloon`, which provides a method `has_balloon?`, and will be mixed into ActiveRecord classes.

```ruby
module HasBalloon
  def has_balloon?
    name == 'Spot' ? true : false # only Spot has a balloon
  end
end
```

This won't work [(really!)](https://github.com/rails/rails/issues/8934):

```ruby
  let(:ar_with_balloon) do
    Class.new(ActiveRecord::Base) do
      attr_accessor :name
      include HasBalloon
      def flowery_name
        "#{b_f}#{name}#{b_f}"
      end
      def b_f
        has_balloon? ? '🎈' : '🌸'
      end
    end
  end
```

So do this instead:

```ruby
  let(:ar_with_balloon) do
    AnonymousActiveRecord.generate(columns: ['name']) do
      include HasBalloon
      def flowery_name
        "#{b_f}#{name}#{b_f}"
      end
      def b_f
        has_balloon? ? '🎈' : '🌸'
      end
    end
  end
  it 'can test the module' do
    expect(ar_with_balloon.new(name: 'Spot').flowery_name).to eq('🎈Spot🎈')
    expect(ar_with_balloon.new(name: 'Not Spot').flowery_name).to eq('🌸Not Spot🌸')
  end
```

### Generate Options

```ruby
AnonymousActiveRecord.generate(
    table_name: 'a_table_name', 
        # if table_name is not set klass_basename will be used to derive a unique random table_name
        # default is a unique random table name
    klass_basename: 'anons', # is default
    columns: ['name'], 
        # default is [], 
        # meaning class will have ['id', 'created_at', 'updated_at'], as the AR defaults
    timestamps: true, # is default
    connection_params: { adapter: 'sqlite3', encoding: 'utf8', database: ':memory:' } # is default
) do
   # code which becomes part of the class definition
end
```

The block is optional.

### Factory Options

```ruby
AnonymousActiveRecord.factory(
    source_data: [{name: 'Phil'}, {name: 'Vickie'}],
        # Array of hashes, where each hash represents a record that will be created
    # ... The rest of the options are the same as for generate, see above.
) do
  # same as for generate, see above.
end
```

The block is optional.

There is also a `factory!` method that will raise if the create fails, accomplished by calling `create!` instead of `create`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pboling/anonymous_active_record. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the AnonymousActiveRecord project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/pboling/anonymous_active_record/blob/master/CODE_OF_CONDUCT.md).
