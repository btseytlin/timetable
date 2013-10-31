class GroupsController < ApplicationController
	def index
		@groups = Group.all
	end
	
	def new
		@group = Group.new
	end
	def show 
		@group = Group.find(params[:id])
		
	end
	def edit
		@group = Group.find(params[:id])
	end
	def create
		@group = Group.new(params[:group])
		
		@group.save
		redirect_to :root
	end
end
