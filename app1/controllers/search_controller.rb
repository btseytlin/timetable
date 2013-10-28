class SearchController < ApplicationController

	def index
		@debug = params.to_s
		@request = params[:search]
		
		@results = search(@request)
	end
	
	def search(string)
		results = []
		Lesson.all.each do |lesson|
			results.push(lesson) if check_params lesson, string
		end
		
		return results
	end
	def check_params(lesson, request)
		attrs = [parsetime lesson.time, lesson.teacher, lesson.room, lesson.group.name, lesson.subject, lesson.day]
		attrs.each do |param|
			param.to_s.downcase
		end
		return true if attrs.include?(request.downcase)
	end
end
