class AdminController < ApplicationController

  before_filter :authenticate_admin

  def index
    @drinks = Drink.includes(:drink_ingredients)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @drinks, :include => :drink_ingredients }
    end
  end

  # PUT /drinks/1.json
  def update
    @drink = Drink.find(params[:id])
    if @drink.update_attributes(
    	name: params[:name], 
    	description: params[:description],
    	instructions: params[:instructions],
    	price: params[:price],
    	approved: params[:approved])
    
    	head :no_content
    else
    	render json: @drink.errors, status: :unprocessable_entity
    end
  end

  def authenticate_admin
    if !current_user or !current_user.admin?
      render file: 'public/404.html', status: 404 and return
    end
  end

end
