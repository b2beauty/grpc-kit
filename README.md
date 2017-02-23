# GRPC::Kit

GRPC toolkit for microservices

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'grpc-kit'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install grpc-kit

## Documentation

- [`GRPC::Kit::Communication::Resilient`](#grpckitcommunicationresilient)
- [`GRPC::Kit::Logger`](#grpckitlogger)
- [`GRPC::Kit::Queue::Publisher`](#grpckitqueuepublisher)
- [`GRPC::Kit::Queue::Worker`](#grpckitqueueworker)

### GRPC::Kit::Communication::Resilient

Sometimes, GRPC and Google::Cloud raises _unavailable error_, but you can retry and all works fine. Based on [Datastore documentation](https://cloud.google.com/appengine/articles/handling_datastore_errors#timeouts-due-to-datastore-issues) we implemented a _helper_ to _resilient communication_.

Example:

```ruby
pubsub = Google::Cloud::Pubsub.new
topic  = pubsub.create_topic('topic_name')
topic.publish('message') # receives Google::Cloud::UnavailableError

# But you can uses resilient communication
include GRPC::Kit::Communication::Resilient
topic = resilient { topic.publish('message') }

# And you can sets the limit of repetition...
topic = resilient(limit: 5) { topic.publish('message') }
```

### GRPC::Kit::Logger

### GRPC::Kit::Queue::Publisher

### GRPC::Kit::Queue::Worker

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/b2beauty/grpc-kit.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

