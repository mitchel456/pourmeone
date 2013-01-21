class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :name
      t.text :description
      t.text :instructions
      t.integer :venue_id
      t.decimal :price
      t.integer :submitted_by
      t.boolean :approved

      t.timestamps
    end
  end
end
