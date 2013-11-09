require 'spec_helper'

describe 'Conversion protocol' do
  describe "for numeric types" do
    it "converts a BigDecimal to a BigDecimal" do
      foo = BigDecimal('42')
      expect( foo.to_bd ).to eq( foo )
    end

    it "converts an integer to a BigDecimal" do
      expect( 42.to_bd ).to eq( BigDecimal('42') )
    end

    it "converts a float to a BigDecimal" do
      expect( 1.23.to_bd ).to eq( BigDecimal('1.23') )
    end
  end

  describe "for strings" do
    it "converts a string to a BigDecimal" do
      expect( '42'.to_bd ).to eq( BigDecimal('42') )
    end

    it "converts a string with commas to a BigDecimal" do
      expect( '42,000'.to_bd ).to eq( BigDecimal('42000') )
    end

    it "converts a string with dollar signs to a BigDecimal" do
      expect( '$42,000'.to_bd ).to eq( BigDecimal('42000') )
    end

    it "doesn't drop decimals either" do
      expect( '$42,000.42'.to_bd ).to eq( BigDecimal('42000.42') )
    end

    it "groks negative numbers" do # oops
      expect( '-42,000.42'.to_bd ).to eq( BigDecimal('-42000.42') )
    end
  end

  describe "for other types" do
    it "converts nil to zero, a la #to_i and #to_f" do
      expect( nil.to_bd ).to eq( BigDecimal('0') )
    end

    it "won't even try to convert an Array to a BigDecimal" do
      expect { %w[ 1 2 3 go ].to_bd }.to raise_error(NoMethodError)
    end
  end
end
