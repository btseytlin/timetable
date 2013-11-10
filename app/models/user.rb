class User < ActiveRecord::Base
  attr_accessible :email, :password

  validates_presence_of :password, :on => :create
  validates_presence_of :email, :on => :create
end
