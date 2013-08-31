class Venue < ActiveRecord::Base
  include Geocodable

  validates :name, :presence => true
  has_many :drinks
  geocoded_by :full_address
  after_validation :geocode

  def full_address
    [address, city, state].join(', ')
  end

end
