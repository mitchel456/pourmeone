class RemoveFilepickerFromDrink < ActiveRecord::Migration
  def change
    remove_column :drinks, :filepicker_url
  end
end
