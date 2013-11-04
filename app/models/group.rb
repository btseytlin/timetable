class Group < ActiveRecord::Base
	has_many :lessons, dependent: :destroy
	attr_accessible :name
	
  validates :name, :presence => true, :uniqueness => true
end
