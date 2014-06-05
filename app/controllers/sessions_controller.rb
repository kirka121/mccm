class SessionsController < ApplicationController
	def new
		
	end

	def create
		user = User.find_by(email: params[:session][:email])
		
		if user && user.authenticate(params[:session][:password])
			sign_in user
			flash[:form_success] = "Login successful."
			redirect_to user
		else
			flash.now[:form_errors] = "Login failed."
			render 'new'
		end
	end

	def destroy
		sign_out
		flash[:form_success] = "Logout successful."
		redirect_to root_url
	end
end
