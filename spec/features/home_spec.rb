require 'spec_helper'

describe 'searching from the home page' do

  before(:each) do
    create(:whiskey_sour)
    create(:manhattan)
    create(:martini)
  end

  it 'should display the results on the drink index' do
    visit '/'
    fill_in 'q_' + Drink.ransack_search_token.to_s, :with => 'Whiskey'
    click_on 'Search'

    page.should have_content 'Whiskey Sour'
    page.should have_content 'Manhattan'
    page.should_not have_content 'Martini'
  end
end