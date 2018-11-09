class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :resource_not_found
  rescue_from NoMethodError, with: :resource_not_found
  protected
  def resource_not_found
  end
end
