big_decimal_helper
==================

Helpers for working with BigDecimals in Rails apps.

* Defines a <code>#to_bd</code> conversion protocol on Float, Fixnum, String, and NilClass to ease finger typing.
* Overrides <code>BigDecimal#inspect</code> to provide a more human-readable format:
  <br />1234.56.to_bd # => #&lt;BigDecimal: 1,234.56&gt;</code>
* Provides an <code>ActiveRecord::Base.has_big_decimal_field</code> macro to automatically convert various fields to BigDecimal.
* Provides some convenience methods for finding the min and max of a list that might possibly include NaN values.  (This can cause some bugs that are extremely annoying to track down.)

## Installation

Add this line to your application's Gemfile:

    gem 'big_decimal_helper'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install big_decimal_helper

## Usage

You'll be able to call <code>#to_bd</code> on any (reasonable) object to ensure that you have a BigDecimal.

Also, if you have a field whose underlying type you can't change, but you want it to be automatically coerced to a BigDecimal, do this:

    class Deal < ActiveRecord::Base
      has_big_decimal_field :final_revenue
    end

This just calls <code>.composed_of</code> behind the scenes, but since I can never remember how to use that API, I wrapped it in a more intention-revealing macro.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
