class HomeController < ApplicationController

  def index
    @search = Drink.search
  end
end
