class DrinkIngredient < ActiveRecord::Base

  belongs_to :ingredient
  belongs_to :drink

end
