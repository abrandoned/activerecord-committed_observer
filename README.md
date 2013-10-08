# Activerecord::CommittedObserver

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'activerecord-committed_observer'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activerecord-committed_observer

## Usage

  Make sure you include CommittedObserver in any of the Observers you 
  want to hook after_commit methods on

```ruby
  class BigObserver < ::ActiveRecord::Observer
    include ::ActiveRecord::CommittedObserver

    def after_commit_on_create(big)
      # do some things and stuff
    end

    def after_commit_on_update(big)
      # Check `previous_changes` because it is after_commit!
    end

  end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
