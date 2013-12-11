require 'spec_helper'
require './lib/better_money'


describe "better-money" do
  it "should tidy amount of dollar" do
    better_money(123.45).should == "$123.45"
    better_money(1234.56).should == "$1.23k"
    better_money(12345678).should == "$12.35M"
    better_money(1234567890).should == "$1.23B"
    better_money(12345678901234).should == "$12.35T"
    better_money(1234567890123456).should == "$1234.57T"
  end
end