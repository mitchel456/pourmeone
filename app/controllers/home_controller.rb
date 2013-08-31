class HomeController < ApplicationController

  def index
    @search = Drink.search
    @nearby_venues = Venue.all
  end
end
