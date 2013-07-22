class HomeController < ApplicationController

  def index
    @recent_drinks = Drink.all
  end
end
