class ApplicationController < ActionController::Base
  include ApplicationHelper

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :prepare_for_mobile
  before_filter :store_current_location

  private

  def mobile_device?
    request.user_agent =~ /Mobile|webOS/
  end

  helper_method :mobile_device?

  def prepare_for_mobile
    request.format = :mobile if mobile_device? and request.format != :json
  end

  def store_current_location
    if params[:lat] and params[:lon]
      @current_location = [params[:lat], params[:lon]]
    end
  end
end
