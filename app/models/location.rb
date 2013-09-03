class Location

  attr_reader :latitude, :longitude

  def initialize(coords)
    @latitude = coords[:latitude]
    @longitude = coords[:longitude]
  end

  def distance_to(other_location)
    return Float::INFINITY unless other_location.respond_to?(:latitude) and other_location.respond_to?(:longitude)
    Geocoder::Calculations.distance_between([latitude, longitude], [other_location.latitude, other_location.longitude])
  end
end