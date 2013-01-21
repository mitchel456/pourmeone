class Ingredient < ActiveRecord::Base
  attr_accessible :approved, :description, :parent_ingredient, :name, :submitted_by

  validates :name, :presence => true
end
