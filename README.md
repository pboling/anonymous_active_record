# AnonymousActiveRecord

<div id="badges">

<div align="center">

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fpboling%2Fanonymous_active_record.svg?type=shield)](https://app.fossa.io/projects/git%2Bgithub.com%2Fpboling%2Fanonymous_active_record?ref=badge_shield)
[![Version](https://img.shields.io/gem/v/anonymous_active_record.svg)](https://rubygems.org/gems/anonymous_active_record)
[![Downloads Today](https://img.shields.io/gem/rd/anonymous_active_record.svg)](https://github.com/pboling/anonymous_active_record)
[![Depfu](https://badges.depfu.com/badges/272ce0df3bc6df5cbea9354e2c3b65af/overview.svg)](https://depfu.com/github/pboling/anonymous_active_record?project_id=5614)
[![CodeCov][🖇codecov-img♻️]][🖇codecov]
[![Test Coverage](https://api.codeclimate.com/v1/badges/fe504d4ab2fb77cecf7d/test_coverage)](https://codeclimate.com/github/pboling/anonymous_active_record/test_coverage)
[![Maintainability](https://api.codeclimate.com/v1/badges/fe504d4ab2fb77cecf7d/maintainability)](https://codeclimate.com/github/pboling/anonymous_active_record/maintainability)
[![CI Supported Build][🚎s-wfi]][🚎s-wf]
[![CI Unsupported Build][🚎us-wfi]][🚎us-wf]
[![CI Style Build][🚎st-wfi]][🚎st-wf]
[![CI Coverage Build][🚎cov-wfi]][🚎cov-wf]
[![CI Heads Build][🚎hd-wfi]][🚎hd-wf]
[![CI Ancient Build][🚎an-wfi]][🚎an-wf]
[![CI Dead Build][🚎ded-wfi]][🚎ded-wf]

[🖇codecov-img♻️]: https://codecov.io/gh/pboling/anonymous_active_record/graph/badge.svg?token=FLAk5BEAkv
[🖇codecov]: https://codecov.io/gh/pboling/anonymous_active_record
[🚎s-wf]: https://github.com/pboling/anonymous_active_record/actions/workflows/supported.yml
[🚎s-wfi]: https://github.com/pboling/anonymous_active_record/actions/workflows/supported.yml/badge.svg
[🚎us-wf]: https://github.com/pboling/anonymous_active_record/actions/workflows/unsupported.yml
[🚎us-wfi]: https://github.com/pboling/anonymous_active_record/actions/workflows/unsupported.yml/badge.svg
[🚎st-wf]: https://github.com/pboling/anonymous_active_record/actions/workflows/style.yml
[🚎st-wfi]: https://github.com/pboling/anonymous_active_record/actions/workflows/style.yml/badge.svg
[🚎cov-wf]: https://github.com/pboling/anonymous_active_record/actions/workflows/coverage.yml
[🚎cov-wfi]: https://github.com/pboling/anonymous_active_record/actions/workflows/coverage.yml/badge.svg
[🚎hd-wf]: https://github.com/pboling/anonymous_active_record/actions/workflows/heads.yml
[🚎hd-wfi]: https://github.com/pboling/anonymous_active_record/actions/workflows/heads.yml/badge.svg
[🚎an-wf]: https://github.com/pboling/anonymous_active_record/actions/workflows/ancient.yml
[🚎an-wfi]: https://github.com/pboling/anonymous_active_record/actions/workflows/ancient.yml/badge.svg
[🚎ded-wf]: https://github.com/pboling/anonymous_active_record/actions/workflows/dead.yml
[🚎ded-wfi]: https://github.com/pboling/anonymous_active_record/actions/workflows/dead.yml/badge.svg

</div>

-----

<div align="center">

[![Liberapay Patrons][⛳liberapay-img]][⛳liberapay]
[![Sponsor Me on Github][🖇sponsor-img]][🖇sponsor]
[![Polar Shield][🖇polar-img]][🖇polar]
[![Donate to my FLOSS or refugee efforts at ko-fi.com][🖇kofi-img]][🖇kofi]
[![Donate to my FLOSS or refugee efforts using Patreon][🖇patreon-img]][🖇patreon]

[⛳liberapay-img]: https://img.shields.io/liberapay/patrons/pboling.svg?logo=liberapay
[⛳liberapay]: https://liberapay.com/pboling/donate
[🖇sponsor-img]: https://img.shields.io/badge/Sponsor_Me!-pboling.svg?style=social&logo=github
[🖇sponsor]: https://github.com/sponsors/pboling
[🖇polar-img]: https://polar.sh/embed/seeks-funding-shield.svg?org=pboling
[🖇polar]: https://polar.sh/pboling
[🖇kofi-img]: https://img.shields.io/badge/buy%20me%20coffee-donate-yellow.svg
[🖇kofi]: https://ko-fi.com/O5O86SNP4
[🖇patreon-img]: https://img.shields.io/badge/patreon-donate-yellow.svg
[🖇patreon]: https://patreon.com/galtzo

<span class="badge-buymealatte">
<a href="https://www.buymeacoffee.com/pboling"><img src="https://img.buymeacoffee.com/button-api/?text=Buy me a latte&emoji=&slug=pboling&button_colour=FFDD00&font_colour=000000&font_family=Cookie&outline_colour=000000&coffee_colour=ffffff" /></a>
</span>

</div>
</div>

This library was 🎩 inspired by 🎩, the [Wolverine project](https://github.com/mcary/wolverine), which [implemented a clever workaround](https://github.com/mcary/wolverine/commit/fa27fa2cc485b2fa83d71b2045ba5a0a069dba75) to the official non-support of [anonymous classes by ActiveRecord](https://github.com/rails/rails/issues/8934).

Warning: Use of this gem is a **security risk**, due to the use of Ruby's `eval`.  It is intended for use in a test suite, or other non-critical environment.

| Project        | AnonymousActiveRecord                                                                                                                                                                                                                                                                                                                                                                                                                                 |
|----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| gem name       | [anonymous_active_record](https://rubygems.org/gems/anonymous_active_record)                                                                                                                                                                                                                                                                                                                                                                          |
| documentation  | [on Github.com][homepage], [on RDoc.info][documentation], [![on Railsbling.com][🚎blog-img]][🚎blog]                                                                                                                                                                                                                                                                                                                                                  |
| code triage    | [![Open Source Helpers](https://www.codetriage.com/pboling/anonymous_active_record/badges/users.svg)](https://www.codetriage.com/pboling/anonymous_active_record)                                                                                                                                                                                                                                                                                     |
| expert support | [![Get help on Codementor](https://cdn.codementor.io/badges/get_help_github.svg)](https://www.codementor.io/peterboling?utm_source=github&utm_medium=button&utm_term=peterboling&utm_campaign=github)                                                                                                                                                                                                                                                 |
| `...` 💖       | [![Liberapay Patrons][⛳liberapay-img]][⛳liberapay] [![Sponsor Me][🖇sponsor-img]][🖇sponsor] [![Follow Me on LinkedIn][🖇linkedin-img]][🖇linkedin] [![Find Me on WellFound:][✌️wellfound-img]][✌️wellfound] [![Find Me on CrunchBase][💲crunchbase-img]][💲crunchbase] [![My LinkTree][🌳linktree-img]][🌳linktree] [![Follow Me on Ruby.Social][🐘ruby-mast-img]][🐘ruby-mast] [![Tweet @ Peter][🐦tweet-img]][🐦tweet] [💻][coderme] [🌏][aboutme] |

<!-- 7️⃣ spread 💖 -->
[🐦tweet-img]: https://img.shields.io/twitter/follow/galtzo.svg?style=social&label=Follow%20%40galtzo
[🐦tweet]: http://twitter.com/galtzo
[🚎blog]: http://www.railsbling.com/tags/anonymous_active_record/
[🚎blog-img]: https://img.shields.io/badge/blog-railsbling-brightgreen.svg?style=flat
[🖇linkedin]: http://www.linkedin.com/in/peterboling
[🖇linkedin-img]: https://img.shields.io/badge/PeterBoling-blue?style=plastic&logo=linkedin
[✌️wellfound]: https://angel.co/u/peter-boling
[✌️wellfound-img]: https://img.shields.io/badge/peter--boling-orange?style=plastic&logo=wellfound
[💲crunchbase]: https://www.crunchbase.com/person/peter-boling
[💲crunchbase-img]: https://img.shields.io/badge/peter--boling-purple?style=plastic&logo=crunchbase
[🐘ruby-mast]: https://ruby.social/@galtzo
[🐘ruby-mast-img]: https://img.shields.io/mastodon/follow/109447111526622197?domain=https%3A%2F%2Fruby.social&style=plastic&logo=mastodon&label=Ruby%20%40galtzo
[🌳linktree]: https://linktr.ee/galtzo
[🌳linktree-img]: https://img.shields.io/badge/galtzo-purple?style=plastic&logo=linktree

<!-- Maintainer Contact Links -->
[aboutme]: https://about.me/peter.boling
[coderme]: https://coderwall.com/Peter%20Boling

## Installation

Install the gem and add to the application's Gemfile by executing,
adding the `--group test` on the end if you will only use it for testing
(which is the only way it should be used):

    $ bundle add anonymous_active_record --group test

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install anonymous_active_record

## Compatibility

This gem is compatible with, as of Sep 2024:
• Ruby 2.4, 2.5, 2.6, 2.7, 3.0, 3.1, 3.2, 3.3, ruby-head, truffleruby-head

## Usage

Require the library in your `spec_helper` or other test suite boot file.

```ruby
require "anonymous_active_record"
```

Let's say you want to write specs for a module, `HasBalloon`, which provides a method `has_balloon?`, and will be mixed into ActiveRecord classes.

```ruby
module HasBalloon
  def has_balloon?
    name == "Spot" # only Spot has a balloon
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
      has_balloon? ? "🎈" : "🌸"
    end
  end
end
```

So do this instead:

```ruby
let(:ar_with_balloon) do
  AnonymousActiveRecord.generate(columns: ["name"]) do
    include HasBalloon
    def flowery_name
      "#{b_f}#{name}#{b_f}"
    end
    def b_f
      has_balloon? ? "🎈" : "🌸"
    end
  end
end
it "can test the module" do
  expect(ar_with_balloon.new(name: "Spot").flowery_name).to(eq("🎈Spot🎈"))
  expect(ar_with_balloon.new(name: "Not Spot").flowery_name).to(eq("🌸Not Spot🌸"))
end
```

### Generate Options

```ruby
AnonymousActiveRecord.generate(
  table_name: "a_table_name",
      # if table_name is not set klass_basename will be used to derive a unique random table_name
      # default is a unique random table name
  klass_basename: "anons", # is default
  columns: ["name"],
      # columns default is [],
      # meaning class will have ['id', 'created_at', 'updated_at'], as the AR defaults
      # Optionally provide an array of hashes and thereby designate column type:
      # [{name: 'name', type: 'string'}, {name: 'baked_at', type: 'time'}]
  timestamps: true, # is default
  indexes: [{columns: ["name"], unique: true}],
      # indexes default is [],
      # meaning class will have no indexes, as the AR defaults
      # Optionally provide an array of hashes of index options (similar to those used in Rails migrations):
      # [{columns: ['name'], unique: true}, {columns: ['baked_at']}]
  connection_params: {adapter: "sqlite3", encoding: "utf8", database: ":memory:"}, # is default
) do
   # code which becomes part of the class definition
end
```

The block is optional.

### Factory Options

```ruby
AnonymousActiveRecord.factory(
  source_data: [{name: "Phil"}, {name: "Vickie"}],
        # Array of hashes, where each hash represents a record that will be created
    # ... The rest of the options are the same as for generate, see above.
) do
  # same as for generate, see above.
end
```

The block is optional.

There is also a `factory!` method that will raise if the create fails, accomplished by calling `create!` instead of `create`.

## 🤝 Contributing

See [CONTRIBUTING.md][🤝contributing]

[🤝contributing]: CONTRIBUTING.md

### Code Coverage

If you need some ideas of where to help, you could work on adding more code coverage.

[![Coverage Graph][🔑codecov-g]][🖇codecov]

[🔑codecov-g]: https://codecov.io/gh/pboling/anonymous_active_record/graphs/tree.svg?token=FLAk5BEAkv

## 🌈 Contributors

[![Contributors][🖐contributors-img]][🖐contributors]

Made with [contributors-img][🖐contrib-rocks].

[🖐contrib-rocks]: https://contrib.rocks
[🖐contributors]: https://github.com/pboling/anonymous_active_record/graphs/contributors
[🖐contributors-img]: https://contrib.rocks/image?repo=pboling/anonymous_active_record

## Star History

<a href="https://star-history.com/#pboling/anonymous_active_record&Date">
 <picture>
   <source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/svg?repos=pboling/anonymous_active_record&type=Date&theme=dark" />
   <source media="(prefers-color-scheme: light)" srcset="https://api.star-history.com/svg?repos=pboling/anonymous_active_record&type=Date" />
   <img alt="Star History Chart" src="https://api.star-history.com/svg?repos=pboling/anonymous_active_record&type=Date" />
 </picture>
</a>

## 🪇 Code of Conduct

Everyone interacting in this project's codebases, issue trackers,
chat rooms and mailing lists is expected to follow the [code of conduct][🪇conduct].

[🪇conduct]: CODE_OF_CONDUCT.md

## 📌 Versioning

This Library adheres to [Semantic Versioning 2.0.0][📌semver].
Violations of this scheme should be reported as bugs.
Specifically, if a minor or patch version is released that breaks backward compatibility,
a new version should be immediately released that restores compatibility.
Breaking changes to the public API will only be introduced with new major versions.

To get a better understanding of how SemVer is intended to work over a project's lifetime,
read this article from the creator of SemVer:

- ["Major Version Numbers are Not Sacred"][📌major-versions-not-sacred]

As a result of this policy, you can (and should) specify a dependency on these libraries using
the [Pessimistic Version Constraint][📌pvc] with two digits of precision.

For example:

```ruby
spec.add_dependency("anonymous_active_record", "~> 1.0")
```

See [CHANGELOG.md][📌changelog] for list of releases.

[comment]: <> ( 📌 VERSIONING LINKS )

[📌pvc]: http://guides.rubygems.org/patterns/#pessimistic-version-constraint
[📌semver]: http://semver.org/
[📌major-versions-not-sacred]: https://tom.preston-werner.com/2022/05/23/major-version-numbers-are-not-sacred.html
[📌changelog]: CHANGELOG.md

## 📄 License

The gem is available as open source under the terms of
the [MIT License][📄license] [![License: MIT][📄license-img]][📄license-ref].
See [LICENSE.txt][📄license] for the official [Copyright Notice][📄copyright-notice-explainer].

[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fpboling%2Fanonymous_active_record.svg?type=large)](https://app.fossa.io/projects/git%2Bgithub.com%2Fpboling%2Fanonymous_active_record?ref=badge_large)

[comment]: <> ( 📄 LEGAL LINKS )

[📄copyright-notice-explainer]: https://opensource.stackexchange.com/questions/5778/why-do-licenses-such-as-the-mit-license-specify-a-single-year
[📄license]: LICENSE.txt
[📄license-ref]: https://opensource.org/licenses/MIT
[📄license-img]: https://img.shields.io/badge/License-MIT-green.svg

### © Copyright

* Copyright (c) 2017 - 2022, 2024 [Peter H. Boling][peterboling] of [Rails Bling][railsbling]

[railsbling]: http://www.railsbling.com
[peterboling]: http://www.peterboling.com
[bundle-group-pattern]: https://gist.github.com/pboling/4564780
[documentation]: http://rdoc.info/github/pboling/anonymous_active_record/frames
[homepage]: https://github.com/pboling/anonymous_active_record
