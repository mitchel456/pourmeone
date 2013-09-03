class Venue < ActiveRecord::Base
  include Geocodable

  validates :name, :presence => true
  has_many :drinks
  geocoded_by :full_address
  after_validation :geocode

  def full_address
    [address, city, state].join(', ')
  end

  def image_url
    unless attributes['image_url']
      @yelp_data ||= get_yelp_data
      update_attribute('image_url', @yelp_data['image_url'])
    end
    attributes['image_url']
  end

  def rating_image_url
    unless attributes['rating_image_url']
      @yelp_data ||= get_yelp_data
      update_attribute('rating_image_url', @yelp_data['rating_img_url'])
    end
    attributes['rating_image_url']
  end

  private
  def get_yelp_data
    consumer = OAuth::Consumer.new(ENV['YELP_CONSUMER_KEY'], ENV['YELP_CONSUMER_SECRET'], {:site => "http://api.yelp.com"})
    access_token = OAuth::AccessToken.new(consumer, ENV['YELP_ACCESS_KEY'], ENV['YELP_ACCESS_SECRET'])
    begin
      JSON.parse(access_token.get("/v2/business/#{yelp_id}").body)
    rescue
      {}
    end
  end

end
