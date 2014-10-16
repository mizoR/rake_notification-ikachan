# RakeNotification::Ikachan

## Installation

Add this line to your application's Gemfile:

    gem 'rake_notification-ikachan', github: 'mizoR/rake_notification-ikachan'

And then execute:

    $ bundle

## Usage

```rb
# config/rake_notification.rb
require 'rake_notification/ikachan'

RakeNotification::Ikachan.url     = 'http://ikachan.example.com:4979'
RakeNotification::Ikachan.channel = '#rake_notification'
```

## Contributing

1. Fork it ( https://github.com/mizoR/rake_notification-ikachan/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
