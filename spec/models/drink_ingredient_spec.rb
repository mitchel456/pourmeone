require 'spec_helper'

describe DrinkIngredient do

  context '#parse' do
  	it "saves the raw text" do
  		DrinkIngredient.parse('1 oz bourbon').raw_text.should eq '1 oz bourbon'
  	end

  	it "extracts the correct ingredient, case-insensitively" do
  	  @bourbon = FactoryGirl.create(:ingredient, name: 'Bourbon')
  	  DrinkIngredient.parse('1 oz bourbon').ingredient.should eq @bourbon
    end

    it "returns a nil ingredient for an unparseable entry" do
    	DrinkIngredient.parse('asdfasfasd').ingredient.should be_nil
    end
  end
end
