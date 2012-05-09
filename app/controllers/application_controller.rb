class ApplicationController < ActionController::Base
  
  protect_from_forgery
  
  def not_authenticated
    redirect_to root_path, :alert => "You cannot access the page before you login"
  end
  
end
