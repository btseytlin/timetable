class Lesson < ActiveRecord::Base
	belongs_to :group
	attr_accessible :day, :room, :subject, :teacher, :time, :group
	
	validates :day, :room, :subject, :teacher, :time, :group, presence: true
	
end
