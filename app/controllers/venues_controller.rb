require 'rest_client'

class VenuesController < ApplicationController

  def autocomplete
    RestClient.get 'https://maps.googleapis.com/maps/api/place/nearbysearch/xml', 
      params: { key: 'AIzaSyDqsZ_NKeq5LZAXOZvlaZ6Zk9CaT39CSm0', location: "37.776888,-122.458543", radius: 1000, sensor: true,
      types: 'establishment', name: params[:query] } do |response, request|
        puts request.inspect
        puts response.inspect
        render json: response
      end
    # puts response.code.inspect
    # render response.body.inspect
  end

end
