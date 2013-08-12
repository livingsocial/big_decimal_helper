require 'spec_helper'

describe 'Pretty #inspect' do
  it "handles NaN" do
    expect(format(0       / 0.to_bd)).to eq('#<BigDecimal: NaN>')
    expect(format(0.to_bd / 0      )).to eq('#<BigDecimal: NaN>')
    expect(format(0.to_bd / 0.to_bd)).to eq('#<BigDecimal: NaN>')
  end

  it "handles Infinity" do
    expect(format(1       / 0.to_bd)).to eq('#<BigDecimal: Infinity>')
    expect(format(1.to_bd / 0      )).to eq('#<BigDecimal: Infinity>')
    expect(format(1.to_bd / 0.to_bd)).to eq('#<BigDecimal: Infinity>')
  end

  it "handles -Infinity" do
    expect(format(-1       / 0.to_bd)).to eq('#<BigDecimal: -Infinity>')
    expect(format(-1.to_bd / 0      )).to eq('#<BigDecimal: -Infinity>')
    expect(format(-1.to_bd / 0.to_bd)).to eq('#<BigDecimal: -Infinity>')
  end

  it "doesn't use pseudoscientific notation" do
    expect(format(1.23)).to eq('#<BigDecimal: 1.23>')
  end

  it "groks negative numbers" do
    expect(format(-1.23)).to eq('#<BigDecimal: -1.23>')
  end

  it "groks negative numbers, even small ones" do
    expect(format(-0.5)).to eq('#<BigDecimal: -0.5>')
  end

  it "inserts commas left of the decimal point" do
    expect(format(1234)).to eq('#<BigDecimal: 1,234>')
  end

  it "inserts commas left of the decimal point in negative numbers" do
    expect(format(-1234)).to eq('#<BigDecimal: -1,234>')
  end

  it "does all of the above at once" do
    expect(format(-1234.56)).to eq('#<BigDecimal: -1,234.56>')
  end

  def format(x)
    x.to_bd.inspect
  end
end
