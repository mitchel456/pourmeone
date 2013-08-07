module Geocodable
  extend ActiveSupport::Concern

  included do
    attr_accessor :distance
  end

  def locate_by
    self
  end

end