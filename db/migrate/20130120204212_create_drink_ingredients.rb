class CreateDrinkIngredients < ActiveRecord::Migration
  def change
    create_table :drink_ingredients do |t|
      t.references :drink
      t.references :ingredient
      t.references :unit
      t.float :amount
      t.string :raw_text

      t.timestamps
    end
  end
end
