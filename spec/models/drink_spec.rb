require 'spec_helper'

describe Drink do

  it "can be created" do
    expect(Drink.new(name: 'Martini')).to be_valid
  end

  it "is invalid without a name" do
    expect(Drink.new).to have(1).errors_on(:name)
  end

end
