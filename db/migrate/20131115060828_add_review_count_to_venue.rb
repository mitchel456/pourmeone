class AddReviewCountToVenue < ActiveRecord::Migration
  def change
  	add_column :venues, :review_count, :integer
  end
end
