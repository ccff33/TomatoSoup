class SessionsController < ApplicationController
  
  def new
    
  end

  def create
    user = login(params[:username], params[:password])
    if user
      redirect_to root_path, :notice => 'Logged in!'
    else
      flash.now.alert = 'Try again'
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
  
end
