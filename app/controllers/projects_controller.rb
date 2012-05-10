class ProjectsController < ApplicationController
  
  before_filter :require_login
  
  def index
    @projects = all_my_projects.paginate_filtered(params[:page] ||= 1, 3,
                                                  params[:name] ||= '')
  end

  def new
    @project = new_my_project
  end

  def create
    @project = new_my_project params[:project]
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
    if @project.hide
      flash[:notice] = 'Project deleted'
    else
      flash[:alert] = 'Project not deleted'
    end
    redirect_to projects_path
  end
  
  protected
  
  def all_my_projects
    current_user.projects.active
  end
  
  def my_project(id)
    all_my_projects.find id
  end
  
  def new_my_project(params = nil)
    current_user.projects.build params
  end
  
end
