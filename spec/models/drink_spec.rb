require 'spec_helper'

describe Drink do
  it "has a valid factory" do
  	FactoryGirl.create(:drink).should be_valid
  end
  
  it "is invalid without a name" do
  	FactoryGirl.build(:drink, name: nil).should_not be_valid
  end

  it "returns any ingredients as an countable of Ingredient models" do
  	FactoryGirl.create(:drink).ingredients.count.should equal 2
  end
end
