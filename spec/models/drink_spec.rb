require 'spec_helper'

describe Drink do

  it "can be created" do
    Drink.new(name: 'Martini').should be_valid
  end

  it "is invalid without a name" do
    Drink.new.should be_invalid
  end

end
