class ManagesController < ApplicationController

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

  def edit_volunteers
    @user = current_user
    @project = Project.find(params[:id])
    @eligible_volunteers = @project.eligible_volunteers
    if request.xhr?
      @volunteers = JSON.parse(params[:volunteers])
      @project.volunteers = @volunteers.map do |id|
        User.find(id.to_i)
      end
      render :json => { :new_path => user_manage_path(current_user.id, @project.id) }
      return
    end
  end

end
