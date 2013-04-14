class DrinksController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => [:create]

  # GET /drinks
  # GET /drinks.json
  def index

    if current_user and current_user.admin?
      @drinks = Drink.all
    else
      @drinks = Drink.where(approved: true)
    end
    # @drinks = current_user and current_user.admin? ? Drink.all : Drink.where(approved: true)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @drinks }
    end
  end

  # GET /drinks/1
  # GET /drinks/1.json
  def show
    @drink = Drink.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @drink }
    end
  end

  # GET /drinks/new
  # GET /drinks/new.json
  def new
    @drink = Drink.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @drink }
    end
  end

  # GET /drinks/1/edit
  def edit
    @drink = Drink.find(params[:id])
  end

  # POST /drinks
  # POST /drinks.json
  def create
    @drink = Drink.create(params[:drink].except(:ingredients, :venue))
    @drink.approved = false

    # process and attach the venue
    if params[:drink][:venue]
      @drink.venue = Venue.where(
        source_id: params[:drink][:venue][:source_id], 
        source: params[:drink][:venue][:source]
      ).first_or_create(params[:drink][:venue])
    end

    # process and attach the ingredients
    if params[:drink][:ingredients]
      params[:drink][:ingredients].each do |ingredient_text|
        @drink.drink_ingredients << DrinkIngredient.create(raw_text: ingredient_text)
      end
    end

    if @drink.save
      render json: @drink, status: :created, location: @drink
    else
      render json: @drink.errors, status: :unprocessable_entity
    end

  end

  # PUT /drinks/1
  # PUT /drinks/1.json
  def update
    @drink = Drink.find(params[:id])

    respond_to do |format|
      if @drink.update_attributes(params[:drink])
        format.html { redirect_to @drink, notice: 'Drink was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @drink.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drinks/1
  # DELETE /drinks/1.json
  def destroy
    @drink = Drink.find(params[:id])
    @drink.destroy

    respond_to do |format|
      format.html { redirect_to drinks_url }
      format.json { head :no_content }
    end
  end
end
