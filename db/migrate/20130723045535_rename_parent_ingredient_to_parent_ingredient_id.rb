class RenameParentIngredientToParentIngredientId < ActiveRecord::Migration
  def change
    rename_column :ingredients, :parent_ingredient, :parent_ingredient_id
  end
end
