require 'spec_helper'

describe DrinksController do

  describe 'GET #index' do

    describe "basic searching" do

      before(:each) do
        @manhattan = create(:drink, name: 'Manhattan')
        @martini = create(:drink, name: 'Martini')
      end

      it "assigns all drinks if no query is specified" do
        get :index
        expect(assigns(:drinks)).to match_array [@manhattan, @martini]
      end

      it "assigns drinks filtered by name if a query is specified" do
        get :index, q: { name_or_ingredients_name_cont: 'martini' }
        expect(assigns(:drinks)).to match_array [@martini]
      end

      it "assigns drinks filtered by ingredient if a query is specified" do
        vermouth = create(:ingredient, name: 'Vermouth')
        @manhattan.ingredients << vermouth
        get :index, q: { name_or_ingredients_name_cont: 'vermouth' }
        expect(assigns(:drinks)).to match_array [@manhattan]
      end

    end

    describe "ordering by distance" do

      before(:all) do
        @middle_drink = create(:drink, id: 1, name: 'Appletini', venue: create(:middle_venue))
        @far_drink = create(:drink, id: 2, name: 'Bitters and Vodka', venue: create(:far_venue))
        @near_drink = create(:drink, id: 3, name: 'Curacao Punch', venue: create(:near_venue))
      end

      it "assigns drinks ordered by name if lat/lon are absent" do
        get :index
        expect(assigns(:drinks)).to eq [@middle_drink, @far_drink, @near_drink]
      end

      it "assigns drinks ordered by distance if lat/lon are passed" do
        venue = create(:venue)
        get :index, lat: venue.latitude, lon: venue.longitude
        expect(assigns(:drinks)).to eq [@near_drink, @middle_drink, @far_drink]
      end

      after(:all) do
        @middle_drink.delete
        @far_drink.delete
        @near_drink.delete
      end

    end

    describe 'GET #show' do

      it "assigns the requested drink to @drink" do
        drink = create(:drink)
        get :show, id: drink
        expect(assigns(:drink)).to eq drink
      end

    end

  end



end
