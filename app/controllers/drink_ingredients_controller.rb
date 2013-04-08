class DrinkIngredientsController < ApplicationController

  def update
    @drink_ingredient = DrinkIngredient.find(params[:id])
	  if @drink_ingredient.update_attributes(params[:drink_ingredient])
	  	head :no_content
	  else
	    render json: @drink.errors, status: :unprocessable_entity
	  end
  end
end
