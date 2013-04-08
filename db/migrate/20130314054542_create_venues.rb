class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.primary_key :id
      t.string :source_id
      t.string :source
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
