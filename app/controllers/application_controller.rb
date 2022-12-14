class ApplicationController < ActionController::Base
private
	def current_user
		Author.find(session[:user_id]) if session[:user_id]
	end

	helper_method :current_user

	def current_user?(user)
		current_user == user
	end

	helper_method :current_user?

end
