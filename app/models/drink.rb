class Drink < ActiveRecord::Base
  attr_accessible :name, :description, :instructions, :price, :venue_id

  validates :name, :presence => true

  has_many :drink_ingredients
  has_many :ingredients, :through => :drink_ingredients
end
