class DrinksController < ApplicationController

  def index
    @search = Drink.search(params[:q])
    @drinks = @search.result
    if params[:lat] and params[:lon]
      @drinks = @drinks.sort_by do |drink|
        drink_point = [drink.venue.latitude, drink.venue.longitude]
        user_point = [params[:lat], params[:lon]]
        Geocoder::Calculations.distance_between(drink_point, user_point)
      end
    end
  end

end
