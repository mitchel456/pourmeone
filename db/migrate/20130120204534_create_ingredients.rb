class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :parent_ingredient
      t.text :description
      t.boolean :approved
      t.integer :submitted_by

      t.timestamps
    end
  end
end
