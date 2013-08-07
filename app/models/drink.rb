class Drink < ActiveRecord::Base
  include Geocodable

  validates :name, :presence => true

  belongs_to :venue
  has_many :drink_ingredients
  has_many :ingredients, :through => :drink_ingredients

  accepts_nested_attributes_for :drink_ingredients

  has_attached_file :image, styles: {
  	thumb: '100x100#',
  	medium: '200x200#'
  }

  def thumbnail_url
    image.url(:thumb)
  end

  def locate_by
    venue
  end

  def self.ransack_search_token
    :name_or_ingredients_name_or_ingredients_parent_ingredient_name_cont
  end
end
