[![Build Status](https://travis-ci.org/jdaviderb/api_football.svg?branch=master)](https://travis-ci.org/jdaviderb/api_football) [![Coverage Status](https://coveralls.io/repos/github/jdaviderb/api_football/badge.svg?branch=master)](https://coveralls.io/github/jdaviderb/api_football?branch=master)

# ApiFootball

A ruby wrapper of https://apifootball.com/

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'api_football'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install api_football

## Usage

### Client

```ruby
  client = ApiFootball::Client.new(api_key: "api_key is required")
```

### Countries

```Ruby
  # Returns list of supported countries

  countries = client.countries.all
```

### Competitions

```Ruby
  # Returns list of supported competitions

  competitions = client.competitions.all

  # Returns list of competitions filtered by country

  competitions = client.competitions.filter_by(country_id: "173")
```

### Standings

```Ruby
  # Returns standings for leagues filtered by league_id
  standings = client.standings.filter_by(league_id: "63")
```

### Odds

```Ruby
  # Returns odds (1x2, BTS, O/U, AH) for events
  from = "2018-08/01"
  to = "2018-08/20"
  odds = client.odds.all(from: from, to: to)

  # Returns odds filtered by match
  odds = client.odds.filter_by(from: from, to: to, match_id: "304968")
```

### H2h
NOT TESTED
```Ruby
  # Returns the last games between submiteted teams and the last games of each team
  first_team = "Chelsea"
  second_team = "Arsenal"
  h2h = client.h2h.all(first_team: first_team, second_team: second_team)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/api_football. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ApiFootball project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/api_football/blob/master/CODE_OF_CONDUCT.md).
