class StatsController < ApplicationController
  
  before_filter :require_login
  
  def index
    @total_working_time = total_working_time
    @estimated_time_to_real_time_ratio_for_goals = estimated_time_to_real_time_ratio_for_goals
    @average_working_time_for_projects = average_working_time_for_projects
  end
  
  protected
  
  def average_working_time_for_projects
    sum = 0
    tmp = current_user.projects.active.total_working_time
    tmp.each {|row| sum += row[1]}
    sum / tmp.count
  end
  
  def estimated_time_to_real_time_ratio_for_goals
    sum = 0;
    tmp = current_user.projects.active.joins(:goals).sum("estimated_time/real_time", :group => "Goals.id")
    tmp.each {|row| sum += row[1].to_f}
    sum / tmp.count
  end
  
  def total_working_time
    current_user.projects.active.joins(:goals).sum(:real_time)
  end
  
end
