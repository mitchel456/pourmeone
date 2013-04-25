require 'rest_client'

class VenuesController < ApplicationController

  def autocomplete
    client = Foursquare2::Client.new(
      :client_id => ENV['FOURSQUARE_CLIENT_ID'],
      :client_secret => ENV['FOURSQUARE_CLIENT_SECRET']
    )
    params[:term] = '' if params[:term].nil?
    results = client.search_venues(
      ll: params[:lat] + ',' + params[:lon], 
      query: params[:term], 
      limit: 10,
      v: '20130304' # version string
    )
    json = results.venues.map do |place|
      { value: place.id, label: place.name, source: 'foursquare' }
    end
    render json: json
  end

end
