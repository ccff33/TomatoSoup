class ApplicationController < ActionController::Base
  
  protect_from_forgery
  
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  
  def not_authenticated
    redirect_to root_path, :alert => "You cannot access the page before you login"
  end
  
  def record_not_found
    raise ActionController::RoutingError.new("Not Found")
  end
  
end
