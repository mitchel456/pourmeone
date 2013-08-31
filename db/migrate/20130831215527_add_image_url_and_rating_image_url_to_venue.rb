class AddImageUrlAndRatingImageUrlToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :image_url, :string
    add_column :venues, :rating_image_url, :string
  end
end
