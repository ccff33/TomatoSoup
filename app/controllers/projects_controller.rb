class ProjectsController < ApplicationController
  
  before_filter :require_login
  
  def index
    @projects = all_my_projects.paginate(:page => params[:page] ||= 1, :per_page => 3)
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
    @project = my_project params[:id]
  end

  def edit
    @project = my_project params[:id]
  end

  def update
    @project = my_project params[:id]
    if @project.update_attributes(params[:project])
      redirect_to project_path(@project), :notice => 'Project updated'
    else
      render :edit
    end
  end

  def destroy
    @project = my_project params[:id]
    @project.archive_flag = true
    if @project.save
      flash[:notice] = 'Project deleted'
    else
      flash[:alert] = 'Project not deleted'
    end
    redirect_to projects_path
  end
  
  protected
  
  def all_my_projects
    current_user.projects.where(:archive_flag => false)
  end
  
  def my_project(id)
    all_my_projects.find id
  end
  
end
