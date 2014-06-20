class SessionsController < ApplicationController
	def new
		
	end

	def create
		user = User.find_by(email: params[:session][:email])

		if user.activation_key.to_s != "activated" && user.needs_activation == 1
			flash[:form_warning] == flash[:form_warning] = "You have registered, however you are required to activate your account to log in. Please check your email and follow the instructions within it."
		  	render 'new'
		  	return
		else
			if user && user.authenticate(params[:session][:password])
				sign_in user
				flash[:form_success] = user.first_name + " logged in." 
				redirect_to user
			else
				flash.now[:form_errors] = "Login failed."
				render 'new'
			end
		end
	end

	def destroy
		sign_out
		flash[:form_success] = "Logout successful."
		redirect_to root_url
	end
end
