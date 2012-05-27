module PomodoroHelper
  def currently_working?
    nil != session[:goal_id]
  end
end
