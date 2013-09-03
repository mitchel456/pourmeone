class HomeController < ApplicationController

  def index
    @search = Drink.search
    @nearby_venues = Venue.all
    @nearby_venues.sort_by! {|v| v.distance_to(current_location)} unless current_location.nil?
  end
end
