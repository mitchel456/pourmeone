require 'spec_helper'

describe Ingredient do

  it "can be created" do
    expect(Ingredient.new(name: 'Whiskey')).to be_valid
  end

  it "is invalid without a name" do
    expect(Ingredient.new).to have(1).errors_on(:name)
  end

end
