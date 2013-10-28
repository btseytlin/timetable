class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def parsetime(string)
	string.to_s.slice(11, 5)
  end
  
  helper_method :parsetime
end
