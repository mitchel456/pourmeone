require 'spec_helper'

describe VenuesController do

  before(:each) do
    Venue.delete_all
  end

  describe 'GET #index' do

    it "populates an array of venues" do
      venue = FactoryGirl.create(:venue)
      get :index
      expect(assigns(:venues)).to match_array [venue]
    end

  end

  describe 'GET #show' do

    it "assigns the requested venue to @venue" do
      venue = create(:venue, name: 'The Alembic')
      get :show, id: venue
      expect(assigns(:venue)).to eq venue
    end

  end

end
