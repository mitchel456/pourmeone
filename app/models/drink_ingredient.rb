class DrinkIngredient < ActiveRecord::Base
  attr_accessible :raw_text, :ingredient, :drink

  belongs_to :ingredient
  belongs_to :drink

  # parse a string and create a drink ingredient
  def self.parse(raw_text)
  	ingredient = DrinkIngredient.new(raw_text: raw_text, ingredient: parse_for_ingredient(raw_text))
  end

  private
  def self.parse_for_ingredient(raw_text)
  	words = raw_text.split
  	# most common case - last word is the ingredient
  	ingredient = Ingredient.where('name ILIKE ?', words.last).first

  	ingredient
  end
end
