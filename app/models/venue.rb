class Venue < ActiveRecord::Base
  #attr_accessible :address, :city, :id, :name, :source, :source_id, :state, :zip

  validates :name, :presence => true

  has_many :drinks
end
