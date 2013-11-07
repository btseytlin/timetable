class LessonsController < ApplicationController
	before_filter :get_group, :only => [:create, :update, :destroy, :show]
  before_filter :check_access, :only =>[:destroy, :update, :new, :create]
  
  def check_access
    redirect_to :root if !admin
  end
	def get_group 
		@group = Group.find(params[:group_id])
	end
	def index
		@lessons = Lesson.all
	end
	def show
		les = params[:lesson]
	end
	def create 
		
		les = params[:lesson]
		les[:group] = @group
		@lesson = @group.lessons.create(les)
		
		respond_to do |format|
			if @lesson
				format.html { redirect_to edit_group_path(@group), notice:'Succesfully added new lesson' }
				format.js 
				format.json { render json: @lesson, status: :created, location: @lesson }
			else
				format.html { redirect_to edit_group_path(@group), notice:'Error!' }
				format.json { render json: @lesson.errors, status: :unprocessable_entity }
			end
		end
	end
	def update
		
		@lesson = @group.lessons.find(params[:id])
		
		@lesson.update_attributes(params[:lesson])
		
		respond_to do |format|
			if @lesson
				format.html { redirect_to edit_group_path(@group), notice: 'Succesfully updated lesson' }
				format.js # { render :json => @lesson, location: edit_group_path(@group) }
				format.json { render json: @lesson}
			else
				format.html { redirect_to edit_group_path(@group), notice:'Error!' }
				format.json { render json: @lesson }
			end
		end
	end

	def destroy
		@lesson = @group.lessons.find(params[:id])
		
		
		respond_to do |format|
			if @lesson.destroy
				format.js 
				format.html { redirect_to edit_group_path(@group), notice:'Succesfully deleted lesson' }
			else
				format.html { redirect_to edit_group_path(@group), notice:'Error!' }
			end
		end
	end
	
	
end
