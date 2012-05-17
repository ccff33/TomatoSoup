class GoalsController < ApplicationController
  
  before_filter :require_login
  before_filter :load_project
  
  def index
    @goals = @project.goals
  end
  
  def new
    @goal = @project.goals.build
  end
  
  def show
    @goal = @project.goals.find params[:id]
  end
  
  def create
    @goal = @project.goals.build params[:goal]
    if @goal.save
      redirect_to project_goal_path(@project, @goal), :notice => 'Goal created'
    else
      render :new
    end
  end
  
  def edit
    @goal = @project.goals.find params[:id]
  end
  
  def update
    @goal = @project.goals.find params[:id]
    if @goal.update_attributes(params[:goal])
      redirect_to project_goal_path(@project, @goal), :notice => 'Goal updated'
    else
      render :edit
    end
  end
  
  def destroy
    @goal = @project.goals.find params[:id]
    if @goal.destroy
      flash[:notice] = 'Goal deleted'
    else
      flash[:alert] = 'Goal not deleted'
    end
    redirect_to project_goals_path(@project)
  end
  
  protected
  
  def load_project
    @project = current_user.projects.find params[:project_id]
  end
  
end
