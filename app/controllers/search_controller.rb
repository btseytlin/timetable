class SearchController < ApplicationController

  def search
    if params[:search] 
      @request = params[:search].strip
     
      @results = @request.size > 1 ? get_results(@request) : []
    else 
      @results = []
    end
 
      respond_to do |format|
        
          format.html 
          format.js 
        
      end
    
	end
	
  def get_results(string)
		results = []
		Lesson.all.each do |lesson|
      results.push(lesson) if check_params(lesson, string.downcase)
		end
		
		return results
	end
	def check_params(lesson, request)
    match = false
		attrs = [parsetime(lesson.time), lesson.teacher, lesson.room, lesson.group.name, lesson.subject, lesson.day]
		attrs.each do |param|
      match = true if param.to_s.downcase.include?(request) 
		end
    return true if match == true
	end
end
