require 'rest_client'

class VenuesController < ApplicationController

  def autocomplete
    client = Foursquare2::Client.new(
      :client_id => ENV['FOURSQUARE_CLIENT_ID'],
      :client_secret => ENV['FOURSQUARE_CLIENT_SECRET']
    )
    results = client.search_venues(l
      l: params[:lat] + ',' + params[:lon], 
      query: params[:term], 
      limit: 10,
      categoryid: '4d4b7105d754a06376d81259')
    json = results.groups.first.items.map do |place|
      { value: place.id, label: place.name, source: 'foursquare' }
    end
    render json: json
  end

end
