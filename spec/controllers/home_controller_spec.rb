require 'spec_helper'

describe HomeController do

  xit "assigns the most recently added drinks to @recent_drinks" do
    drink = create(:drink)
    get :index
    expect(assigns(:recent_drinks)).to match_array [drink]
  end

end
