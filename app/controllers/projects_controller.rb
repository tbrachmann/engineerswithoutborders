class ProjectsController < ApplicationController
	def index
		@projects = Project.page(params[:page]).per(3)
	end
	
	def show
		@project = Project.find(params[:id])
	end
	
	def edit
		@project = Project.find(params[:id])
	end
	
	def create
		@project = Project.new(project_params)
		if @project.save
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