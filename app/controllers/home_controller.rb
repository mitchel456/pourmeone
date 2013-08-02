class HomeController < ApplicationController

  def index
    @search = Drink.search
    @recent_drinks = Drink.all
  end
end
