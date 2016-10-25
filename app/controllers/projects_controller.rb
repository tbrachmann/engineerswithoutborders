class ProjectsController < ApplicationController
	def index
		@projects = Project.page(params[:page]).per(3)
	end
	def show
		@project = Project.find(params[:id])
	end
	def create
	end
end