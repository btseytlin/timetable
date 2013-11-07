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
    #redirect_to :root if !admin
		@group = Group.find(params[:id])
	end
	def create
    
		@group = Group.new(params[:group])
		
		@group.save
		redirect_to :root
	end
  
  def destroy
		@group = Group.find(params[:id])
		
		respond_to do |format|
			if @group.destroy
				format.js 
				format.html { redirect_to :root, notice:'Succesfully deleted group' }
			else
				format.html { redirect_to :root, notice:'Error!' }
			end
    end
  end
end
