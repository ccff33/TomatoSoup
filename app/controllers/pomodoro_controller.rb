class PomodoroController < ApplicationController
  
  before_filter :require_login
  before_filter :load_goal
  
  def index
    
  end
  
  def start
    flash[:alert] = 'Already working' if session[:goal_id]
    session[:goal_id] ||= @goal.id
    session[:start_time] ||= Time.now
    redirect_to pomodoro_path
  end
  
  def pause
    
  end
  
  def continue
    
  end

  def stop
    elapsed_time_in_minutes = (Time.now - session[:start_time]) / 1.minute
    if elapsed_time_in_minutes < Goal::POMODORO_IN_MINUTES
      flash[:alert] = 'You are not ready with the pomodoro'
      redirect_to pomodoro_path
    else
      session[:goal_id] = nil
      session[:start_time] = nil
      @goal.pomodoro_up
      @goal.save
      flash[:notice] = 'One pomodoro up!!!'
      redirect_to project_goal_path(@goal.project, @goal)
    end
  end
  
  protected
  
  def load_goal
    id = session[:goal_id] || params[:goal_id]
    @goal = Goal.where(:accomplished => false).find id
    raise ActiveRecord::RecordNotFound unless @goal.project.user == current_user
  end
  
end