require 'spec_helper'

describe AdminController do

  describe "GET index" do

    before(:all) do
      @user = create(:user)
      @admin = create(:user, admin: true)
    end

    it "renders the :index view for a currently logged in admin" do
      sign_in @admin
      get :index
      expect(response).to render_template :index
    end

    it "returns a 404 for a non-logged-in user" do
      get :index
      expect(response.response_code).to eq(404)
    end

    it "returns a 404 for a logged-in non-admin" do
      sign_in @user
      get :index
      expect(response.response_code).to eq(404)
    end

    after(:all) do
      @user.delete
      @admin.delete
    end

  end

end
