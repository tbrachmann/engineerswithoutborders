class ManagesController < ApplicationController
  # load_and_authorize_resource

  def index
    if(!current_user.manager?)
      redirect_to projects_path
    end
    @projects = @all_projects = current_user.manages
  end

  def show
    @project = Project.find(params[:id])
    session[:current_project_id] = @project.id
	  @project_availability_hash = @project.availability_hash
	  @in_demand = InDemand.qualities_by_project_id(@project.id)
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
  
  def admin
    unauthorized! if cannot? :access, :rails_admin
  end

end
