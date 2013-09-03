json.array! @venues do |venue|
  json.id venue.id
  json.name venue.name
  json.image_url venue.image_url
  json.rating_image_url venue.rating_image_url
  json.address venue.full_address
  json.distance "%.1f" % venue.distance_to(current_location, :mi)
end