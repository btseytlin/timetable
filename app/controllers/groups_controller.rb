class GroupsController < ApplicationController
  before_filter :check_access, :only =>[:destroy, :edit, :update, :new, :create, :copy]
  def check_access
    redirect_to :root if !admin
  end
	def index
		@groups = Group.all
    
    @groups_by_course_number = @groups.group_by { |group| group.name[3] }
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
  def copy
    
		@group = Group.find(params[:id])
    @newgroup = @group.dup(:include => :lessons)
    @newgroup.name = params[:name]
    if @newgroup.save 
      redirect_to @newgroup
    else
      redirect_to :root
    end
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
