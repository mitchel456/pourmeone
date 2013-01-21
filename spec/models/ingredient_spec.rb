require 'spec_helper'

describe Ingredient do
  it "has a valid factory" do
  	FactoryGirl.create(:ingredient).should be_valid
  end

  it "is invalid without a name" do
  	FactoryGirl.build(:ingredient, name: nil).should_not be_valid
  end
end
