class HomeController < ApplicationController

  def index
    @search = Drink.search
    @venues = Venue.near(request.ip).paginate(page: params[:page], per_page: 12)
  end
end
