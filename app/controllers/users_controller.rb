class UsersController < ApplicationController
  
  before_filter :require_login, :only => [:edit, :update]
  
  layout "sessions", :only => :new
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new params[:user]
    if @user.save
      redirect_to root_path, :notice => 'Registered successfully!'
    else
      render :new
    end
  end
  
  def edit
    @user = current_user
  end
  
  def update
    if current_user.update_attributes params[:user]
      redirect_to edit_user_path, :notice => "Updated successfully"
    else
      @user = current_user
      render :edit
    end
  end
  
end
