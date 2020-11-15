# recruitee-ruby

An unofficial client for the [Recruitee](http://recruitee.com/)
[Private API](https://api.recruitee.com/docs/index.html).

## Installation

Add this line to your application's Gemfile:

    gem 'recruitee'

And then execute:

    $ bundle

Or install it yourself:

    $ gem install recruitee

### Setup

Create an instance of the client with your company ID and API token. These can
be found under [Personal API tokens](https://app.recruitee.com/#/settings/api_tokens)
under the "Apps and plugins" section of your settings.

If you're using Rails, create an initializer `config/initializers/recruitee.rb`:

```ruby
$recruitee = Recruitee::Client.new("COMPANY_ID", "API_TOKEN")
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
