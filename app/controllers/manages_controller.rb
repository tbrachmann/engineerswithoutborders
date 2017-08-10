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

  def edit_volunteers
    @user = current_user
    @project = Project.find(params[:id])
    @eligible_volunteers = @project.eligible_volunteers
    if request.xhr?
      @volunteers = JSON.parse(params[:multi_selected])
      @project.volunteers = @volunteers.map do |id|
        User.find(id.to_i)
      end
      render :json => { :new_path => user_manage_path(current_user.id, @project.id) }
      return
    end
  end

  def edit_managers
    @user = current_user
    @project = Project.find(params[:id])
    # Only people that have been approved as managers can be added.
    @eligible_managers = @project.eligible_managers
    if request.xhr?
      @managers = JSON.parse(params[:multi_selected])
      @project.managers = @managers.map do |id|
        User.find(id.to_i)
      end
      render :json => { :new_path => user_manage_path(current_user.id, @project.id) }
      return
    end
  end

  def edit_indemand
    @user = current_user
    @project = Project.find(params[:id])
    @eligible_indemand = @project.eligible_indemand_grouped
    if request.xhr?
      qualities = JSON.parse(params[:multi_selected])
      qualities.each do |quality|
        split = quality.split(".")
        table_name = split[0]
        table_id = split[1]
        row = table_name.constantize.find(table_id)
        @project.add_in_demand_quality(row)
      end
      render :json => { :new_path => user_manage_path(current_user.id, @project.id) }
    end
  end
  
end
