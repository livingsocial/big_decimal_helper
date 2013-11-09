require 'spec_helper'

unless defined?(ActiveRecord::Base)
  module ActiveRecord
    class Base
    end
  end
end

describe 'ActiveRecord mixin' do
  before(:all) do
    BigDecimalHelper.add_active_record_macro!
  end

  it 'gets mixed in to ActiveRecord::Base' do
    expect(ActiveRecord::Base).to be_kind_of( BigDecimalHelper::HasBigDecimalField )
  end

  it 'adds a .has_big_decimal_field method that invokes .composed_of' do
    expect(ActiveRecord::Base).to receive( :composed_of )
    ActiveRecord::Base.class_eval do
      has_big_decimal_field :foo
    end
  end
end
