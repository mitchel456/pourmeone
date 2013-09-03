module Geocodable
  extend ActiveSupport::Concern

  included do
    attr_accessor :distance
  end

  def location
    Location.new(latitude: self.latitude, longitude: self.longitude)
  end

  def distance_to(other_location)
    location.distance_to other_location
  end

end