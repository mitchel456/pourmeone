class AddImageToDrink < ActiveRecord::Migration
  def change
    add_attachment :drinks, :image
  end
end
