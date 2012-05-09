class ProjectsController < ApplicationController
  
  before_filter :require_login
  
  def index
    # TODO: check if params[:page] is int
    @projects = current_user.projects.paginate(:page => params[:page] ||= 1, :per_page => 3)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    @project.user_id = current_user.id
    if @project.save
      redirect_to projects_path, :notice => 'Project created'
    else
      render :new
    end
  end

  def show
    @project = current_user.projects.find params[:id]
  end

  def edit
    @project = current_user.projects.find params[:id]
  end

  def update
    @project = current_user.projects.find params[:id]
    if @project.update_attributes(params[:project])
      redirect_to project_path(@project), :notice => 'Project updated'
    else
      render :edit
    end
  end

  def destroy
    @project = current_user.projects.find params[:id]
    if @project.destroy
      flash[:notice] = 'Project deleted'
    else
      flash[:alert] = 'Project not deleted'
    end
    redirect_to projects_path
  end
  
end
