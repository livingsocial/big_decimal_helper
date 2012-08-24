big_decimal_helper
==================

Helpers for working with BigDecimals in Rails apps.

* Defines a #to_bd conversion protocol to ease finger typing
* Provides an ActiveRecord <code>.has_big_decimal_field</code> macro to facilitate presentation of float fields as BigDecimal.

## Installation

Add this line to your application's Gemfile:

    gem 'big_decimal_helper'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install big_decimal_helper

## Usage

You'll be able to call #to_bd on any object to convert it (if necessary) to a BigDecimal.

Also, if you have a field whose underlying type you can't change, but you want it to be automatically coerced to a BigDecimal, do this:

    class Deal < ActiveRecord::Base
      has_big_decimal_field :final_revenue
    end

This just calls .composed_of behind the scenes, but since I can never remember how to use that, I wrapped it in a more intention-revealing macro.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request