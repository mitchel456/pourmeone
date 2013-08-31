class VenuesController < ApplicationController

  def index
    @venues = Venue.all
    if params[:lat] and params[:lon]
      @venues.each do |venue|
        venue_point = [venue.latitude, venue.longitude]
        user_point = [params[:lat], params[:lon]]
        venue.distance = Geocoder::Calculations.distance_between(venue_point, user_point)
      end
      @venues = @venues.sort {|a,b| a.distance <=> b.distance }
    end
  end

  def show
    @venue = Venue.find(params[:id])
    @yelp_venue = YelpBusiness.new(@venue.yelp_id)
  end

end
