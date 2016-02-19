# RubyMaxima

Use Maxima (a computer algebra system) from Ruby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby_maxima'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby_maxima

## Usage

RubyMaxima has a single class to work with: the `Session`. It practically translates all methods into Maxima calls, except for:

  * `execute` - This executes all the commands in the session.
  * `commands` - Here you can have a look at the current commands in the session.
  * `debug=` - Here you can set the debug mode. When it is set to true, RubyMaxima will print the output from maxima.

RubyMaxima will automatically translate hashes: `constraints: 'x+y<=100'` becomes `constraints = x+y<=100`.
Here is an example:
```
  s = RubyMaxima::Session.new
  s.load 'fmin_cobyla'
  s.fmin_cobyla '-(x*y)',['x', 'y'], [1,1], constraints: ['x*y<=49']
  eval s.execute # handle this line with absolute care!
```

## Todos

Feel free to open issues for missing features.

* I did not implement the basic arithmetic operations, since I don't need them.
* Implement an `assigns` method on session which takes a variable name and a block and assigns the result of the block to the variable in maxima.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/phikes/ruby_maxima.

