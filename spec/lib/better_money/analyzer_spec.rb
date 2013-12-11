require 'spec_helper'
require './lib/better_money/analyzer'


describe BetterMoney::Analyzer do
  describe "#currency_symbol" do
    it "should find symbol of current currency" do
      analyzer = BetterMoney::Analyzer.new(9999)
      analyzer.currency_symbol.should == "$"
    end
  end

  describe "#value" do
    it "should find value of current currency" do
      analyzer = BetterMoney::Analyzer.new(123)
      analyzer.value.should == 123.00

      analyzer = BetterMoney::Analyzer.new(12345)
      analyzer.value.should == 12.35

      analyzer = BetterMoney::Analyzer.new(12345678)
      analyzer.value.should == 12.35

      analyzer = BetterMoney::Analyzer.new(1234567890)
      analyzer.value.should == 1.23
    end
  end

  describe "#unit_symbol" do
    it "should find unit of current currency" do
      analyzer = BetterMoney::Analyzer.new(123)
      analyzer.unit_symbol.should == ""

      analyzer = BetterMoney::Analyzer.new(12345)
      analyzer.unit_symbol.should == "k"

      analyzer = BetterMoney::Analyzer.new(12345678)
      analyzer.unit_symbol.should == "M"

      analyzer = BetterMoney::Analyzer.new(1234567890)
      analyzer.unit_symbol.should == "B"
    end
  end

  describe "#seperate_level" do
    it "should find seperate level" do
      analyzer = BetterMoney::Analyzer.new(123)
      analyzer.seperate_level.should == 0

      analyzer = BetterMoney::Analyzer.new(12345)
      analyzer.seperate_level.should == 1

      analyzer = BetterMoney::Analyzer.new(12345678)
      analyzer.seperate_level.should == 2

      analyzer = BetterMoney::Analyzer.new(1234567890)
      analyzer.seperate_level.should == 3
    end
  end

end


