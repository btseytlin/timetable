class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def parsetime(string)
	string.to_s.slice(11, 5)
  end
  def shorten(string)
  string.to_s.slice(0, 3)
  end
  helper_method :shorten
  helper_method :parsetime
end
