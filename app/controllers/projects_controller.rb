class ProjectsController < ApplicationController
	def index
		@projects = Project.page(params[:page]).per(3)
	end
	
	def show
		@project = Project.find(params[:id])
	end
	
	def create
		# @project = Project.new(params[:project])
		@project = Project.new(project_params)
		if @project.save
			redirect_to @project, notice: "Successfully created project."
		else
			render :new
		end
	end
	
	private
	def project_params
		params.require(:project).permit(:name, :description, :volunteer_capacity, :volunteers, :location)
	end
	
	def new 
		@project = Project.new
	end
	
	def destroy
		@project = Project.find(params[:id])
		@project.destroy
		redirect_to project_path, notice: "Successfully destroyed project"
	end
end