class DrinkIngredient < ActiveRecord::Base
  #attr_accessible :raw_text, :ingredient_id, :drink

  validates :raw_text, :drink_id, :presence => true

  belongs_to :ingredient
  belongs_to :drink

end
