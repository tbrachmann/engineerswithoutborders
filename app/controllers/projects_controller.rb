class ProjectsController < ApplicationController
	before_filter :authenticate_user!, except: [:index, :show]
	
	def index
		@projects = @all_projects = Project.all
		@projects_by_date = @projects.group_by(&:start_date)
		@date = Date.today
	end

	def show
	    @project = Project.find(params[:id])
	    @project_availability_hash = @project.availability_hash   
=begin       
		if @project && @project.skills
			@skills = @project.skills().map{|x| x.name}.join(", ")
		end
=end
		session[:current_project_id] = @project.id
	end

	def new
		@project = Project.new
	end
	
	def edit
		@project = Project.find(params[:id])
	end
	
	def create
		@project = Project.new(project_params)
		if @project.save
			@project.managers << current_user
			redirect_to @project, notice: "Successfully created project."
		else
			render :new
		end
	end
	
	def update
		@project = Project.find(params[:id])
		if @project.update(project_params)
			redirect_to @project, notice: "Successfully updated project."
		else
			render :edit
		end
	end			
	
	private

	def project_params
		params.require(:project).permit(:name, :description, :start_date, :volunteer_capacity, :location, :image, :hours_per_week)
	end

	def destroy
		@project = Project.find(params[:id])
		@project.destroy
		redirect_to project_path, notice: "Successfully destroyed project"
	end
end
