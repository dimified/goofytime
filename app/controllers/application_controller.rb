# Fachhochschule Salzburg
# MultimediaTechnology B 2010
# Basisqualifikationsprojekt 2a
# Daniel Krenmayr, Dimitri Reifschneider

class ApplicationController < ActionController::Base
	helper_method :current_user
	
  protect_from_forgery

  public
	
	def self.random
    if (c = count) != 0
      find(:first, :offset =>rand(c))
    end
  end
  
  private
  
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
end
