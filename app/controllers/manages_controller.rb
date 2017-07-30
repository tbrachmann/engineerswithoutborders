class ManagesController < ApplicationController

  def index
    if(!current_user.manager?)
      redirect_to projects_path
    end
    @all_projects = current_user.manages
    @projects = @all_projects.page(params[:page]).per(3)
  end

  def show
    @project = Project.find(params[:id])
    session[:current_project_id] = @project.id
  end
  
  def create
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
