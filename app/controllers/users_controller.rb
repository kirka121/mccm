class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]


@@reg_mode = Settings.find(1).registration_mode


def index
	if current_user != nil
		@user = current_user
	else
		flash[:form_errors] = "You can not view the list of users!"
		redirect_to root_path
	end
end

  def new
  	@user = User.new
  end

  def show
    if params[:page] != nil
      @page = params[:page]
    end

  	if(signed_in?)
  		@user = User.find(params[:id])
  	else
  		flash[:form_errors] = "You must be logged in or admin to view users"
  		redirect_to '/home'
  	end
  end

  def create
  	if @@reg_mode == 0
	  	@user = User.new(user_params) #not final
	  	@user.needsactivation = false
	  	@user.activation_key = nil

	  	if @user.save
	  		sign_in @user
	  		flash[:form_success] = "You have logged in."
	  		redirect_to @user
	  	else
	  		flash[:form_errors] = "Failure. Some parameters are invalid: <ul>"
	  		@user.errors.full_messages.each do |error|
	  			flash[:form_errors] += "<li>" + error + "</li>"
	  		end
	  		flash[:form_errors] += "</ul>"

	  		render 'new'
	  	end
	  elsif @@reg_mode == 1
	  	@user = User.new(user_params) #not final
	  	@user.needs_activation = true
	  	@user.activation_key = generate_activation_key

	  	if @user.save
	  		McMailer.verification(@user).deliver
	  		flash[:form_alert] = "You have registered, however you are required to activate your account to log in. Please check your email and follow the instructions within it."
		  	redirect_to register_path
		end
	  end
  end

  def edit
    @user = User.find(params[:id])
  end

  def email
  	@user = current_user
  end

def update
	@user = User.find(params[:id])
    
	if @user.update_attributes(user_params)
		flash[:form_success] = "User " + @user.first_name + " updated successfully."
		redirect_to @user
	else
		flash[:form_errors] = "Failure. Some parameters are invalid: <ul>"
		@user.errors.full_messages.each do |error|
			flash[:form_errors] += "<li>" + error + "</li>"
		end
		flash[:form_errors] += "</ul>"
		render 'edit'
	end
end

  private 
		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar)
		end

		def generate_activation_key
			o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
			string = (0...50).map { o[rand(o.length)] }.join
			#return Digest::MD5.hexdigest(string) if want MD5 the string as well
			return string
		end

		def signed_in_user
			unless signed_in?
				flash[:form_errors] = "You have to sign in to perform this action."
				redirect_to signin_url 
			end
		end

		def correct_user
			@user = User.find(params[:id])
			unless current_user?(@user) || current_user.admin_level == 1
				flash[:form_errors] = "You are trying to operate as the wrong user. Contact administration."
				redirect_to(root_url) 
			end
		end
end