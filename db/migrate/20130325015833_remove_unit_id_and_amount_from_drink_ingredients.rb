class RemoveUnitIdAndAmountFromDrinkIngredients < ActiveRecord::Migration
  def change
    remove_column :drink_ingredients, :unit_id
    remove_column :drink_ingredients, :amount
  end
end
