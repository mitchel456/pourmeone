class VenuesController < ApplicationController

  def index
    @venues = Venue.all
    @venues.sort_by! {|v| v.distance_to(current_location)} unless current_location.nil?
  end

  def show
    @venue = Venue.find(params[:id])
  end

end
