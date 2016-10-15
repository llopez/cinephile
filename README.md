# Cinephile

Cinephile is a simple Client to collect Cinema/Movie/Schedule information from several sources. 
Also this gem is kinda build following the adapter patter, it makes contributions easier.

current sources are:

- Hoyts 
- Cinemark

but you can add your own sources.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cinephile'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cinephile

## Usage

```ruby
client = Cinephile::Client.new(:hoyts)
client.cinemas
client.movies(cinema)
client.days(cinema, movie)
client.hours(cinema, movie, day)

client = Cinephile::Client.new(:cinemark)
client.cinemas
client.movies(cinema)
client.days(cinema, movie)
client.hours(cinema, movie, day)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/llopez/cinephile


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
