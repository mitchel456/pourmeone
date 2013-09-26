ActiveAdmin.register Drink do

  form :partial => 'form'

  index do
    column :name
    column :venue
    column :price
    actions
  end

  show do
    h3 drink.name
    img src: drink.filepicker_url
  end

  controller do

    def create
      @drink = Drink.create(permitted_params[:drink])
      permitted_params[:ingredients].each do |drink_ingredient|
        if drink_ingredient[:id].empty?
          ingredient = Ingredient.create(name: drink_ingredient[:name])
        else
          ingredient = Ingredient.find(drink_ingredient[:id])
        end
        @drink.ingredients << ingredient
      end
      @drink.save
      redirect_to [:admin, @drink]
    end

    def update
      @drink = Drink.find(params[:id])
      # remove all ingredients in preparation for re-adding them next
      @drink.drink_ingredients.delete_all
      # add or create ingredients as necessary
      permitted_params[:ingredients].each do |drink_ingredient|
        if drink_ingredient[:id].empty?
          ingredient = Ingredient.create(name: drink_ingredient[:name])
        else
          ingredient = Ingredient.find(drink_ingredient[:id])
        end
        @drink.ingredients << ingredient
      end
      @drink.update_attributes(permitted_params[:drink])
      @drink.save
      redirect_to [:admin, @drink]
    end

    def permitted_params
      params.permit!
    end
  end
end
