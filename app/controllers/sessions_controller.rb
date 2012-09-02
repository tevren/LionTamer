class SessionsController < ApplicationController
	def create
		auth = request.env["omniauth.auth"]
		user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
		session[:user_id] = user.id    
		respond_to do |format|
			format.html { redirect_to root_url, :notice => "Logged in!" }
		end
	end

	def destroy
		session[:user_id] = nil
		respond_to do |format|
			format.html { redirect_to root_url, :notice => "Logged out!" }
		end
	end

	def failure
		respond_to do |format|
			format.html { redirect_to root_url, :alert => "Incorrect login information" }
		end
	end
end
