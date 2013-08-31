class YelpBusiness

  def initialize(yelp_id)
    @yelp_id = yelp_id
  end

  def star_rating_url
    @yelp_data ||= get_yelp_data
    @yelp_data['rating_img_url']
  end

  private
  def get_yelp_data
    uri = URI('http://api.yelp.com/v2/business/the-alemic-san-francisco')
    consumer = OAuth::Consumer.new(ENV['YELP_CONSUMER_KEY'], ENV['YELP_CONSUMER_SECRET'], site: 'http://api.yelp.com')
    access_token = OAuth::AccessToken.new(consumer, ENV['YELP_ACCESS_KEY'], ENV['YELP_ACCESS_SECRET'])

    uri = URI('http://api.yelp.com/v2/business/the-alembic-san-francisco')
    signed_request = consumer.create_signed_request(:get, '/v2/business/the-alembic-san-francisco', access_token)

    http = Net::HTTP.new(uri.host, uri.port)
    response = http.request(signed_request)
    JSON.parse(response.body)
  end

end