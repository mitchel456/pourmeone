require 'spec_helper'

describe Ingredient do

  it "has a valid factory" do
    expect(create(:ingredient)).to be_valid
  end

  it "is invalid without a name" do
    expect(build(:ingredient, name: nil)).to be_invalid
  end
end
