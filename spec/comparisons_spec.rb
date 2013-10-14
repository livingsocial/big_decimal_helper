require 'spec_helper'

describe "comparison helper(s, eventually)" do
  it "checks sanity" do
    expect(nan).to     be_nan
    expect(nan).to_not be_infinite

    expect(pos_inf).to_not be_nan
    expect(pos_inf).to     be_infinite

    expect(neg_inf).to_not be_nan
    expect(neg_inf).to     be_infinite
  end
  
  let(:nan)     {  0.to_bd / 0.to_bd }
  let(:pos_inf) {  1.to_bd / 0.to_bd }
  let(:neg_inf) { -1.to_bd / 0.to_bd }
  let(:batman)  { -1.to_bd }

  describe BigDecimalHelper::Comparisons do
    describe ".max_of" do
      def max_of(list)
        BigDecimalHelper.max_of(list)
      end

      it "returns nil for an empty list" do
        expect( max_of([]) ).to be_nil
      end

      it "returns nil for a list with nan in it" do
        expect( max_of([nan]) ).to be_nil
      end

      it "returns 23 for a list containing just 23" do
        expect( max_of([23]) ).to eq(23)
      end

      it "returns 42 for a list containing 23 and 42" do
        expect( max_of([42, 23]) ).to eq(42)
        expect( max_of([23, 42]) ).to eq(42)
      end

      it "returns numeric output as BigDecimal" do
        expect( max_of([23]) ).to be_kind_of(BigDecimal)
      end

      it "returns 42 for a list with nan and 42 in it" do
        expect( max_of([42, nan]) ).to eq(42)
      end

      it "returns +infinity for a list with a +infinity" do
        expect( max_of([42, pos_inf]) ).to eq(pos_inf)
      end

      it "returns any other number for a list with a -infinity and any other number" do
        expect( max_of([42, neg_inf]) ).to eq(42)
      end
    end

    describe ".min_of" do
      def min_of(list)
        BigDecimalHelper.min_of(list)
      end

      it "returns nil for an empty list" do
        expect( min_of([]) ).to be_nil
      end

      it "returns nil for a list with nan in it" do
        expect( min_of([nan]) ).to be_nil
      end

      it "returns 23 for a list containing just 23" do
        expect( min_of([23]) ).to eq(23)
      end

      it "returns 23 for a list containing 23 and 42" do
        expect( min_of([42, 23]) ).to eq(23)
        expect( min_of([23, 42]) ).to eq(23)
      end

      it "returns numeric output as BigDecimal" do
        expect( min_of([23]) ).to be_kind_of(BigDecimal)
      end

      it "returns 42 for a list with nan and 42 in it" do
        expect( min_of([42, nan]) ).to eq(42)
      end

      it "returns 42 for a list with a +infinity" do
        expect( min_of([42, pos_inf]) ).to eq(42)
      end

      it "returns -infinity for a list with a -infinity and any other number" do
        expect( min_of([42, neg_inf]) ).to eq(neg_inf)
      end
    end
  end
end
