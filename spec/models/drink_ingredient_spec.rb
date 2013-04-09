require 'spec_helper'

describe DrinkIngredient do

  it "has a valid factory" do
    expect(create(:drink_ingredient)).to be_valid
  end

  it "is invalid without a drink_id" do
    expect(build(:drink_ingredient, drink_id: nil)).to be_invalid
  end

  it "is invalid without any raw text" do
    expect(build(:drink_ingredient, raw_text: nil)).to be_invalid
  end

end
