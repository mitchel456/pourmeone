class Drink < ActiveRecord::Base
  attr_accessible :approved, :name, :description, :instructions, :price, :image, :venue

  validates :name, :presence => true

  belongs_to :venue
  has_many :drink_ingredients
  has_many :ingredients, :through => :drink_ingredients

  has_attached_file :image, styles: {
  	thumb: '100x100#',
  	medium: '200x200#'
  }
end
