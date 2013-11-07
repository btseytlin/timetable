class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def parsetime(string)
  	string.to_s.slice(11, 5)
  end
  def shorten(string)
    string.to_s.slice(0, 3)
  end
  def admin
   if User.all.empty?
     return true
   end
    
   if current_user 
      return true
    end
  end
  def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :admin
  helper_method :current_user
  helper_method :shorten
  helper_method :parsetime
end
