require 'spec_helper'

describe 'Conversion protocol' do
  it "converts a string to a BigDecimal" do
    '42'.to_bd.should == BigDecimal('42')
  end

  it "converts a float to a BigDecimal" do
    1.23.to_bd.should == BigDecimal('1.23')
  end

  it "converts a BigDecimal to a BigDecimal" do
    foo = BigDecimal('42')
    foo.to_bd.should == foo
  end

  it "converts a BigDecimal to itself" do
    foo = BigDecimal('42')
    foo.to_bd.should be(foo)
  end

  it "converts a string with commas to a BigDecimal" do
    '42,000'.to_bd.should == BigDecimal('42000')
  end

  it "converts a string with dollar signs to a BigDecimal" do
    '$42,000'.to_bd.should == BigDecimal('42000')
  end

  it "doesn't drop decimals either" do
    '$42,000.42'.to_bd.should == BigDecimal('42000.42')
  end
end
