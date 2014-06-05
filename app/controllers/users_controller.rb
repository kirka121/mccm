class UsersController < ApplicationController
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
  	@user = User.new(user_params) #not final

  	if @user.save
  		sign_in @user
  		flash[:form_success] = "You have logged in."
  		redirect_to @user
  	else
  		flash[:form_errors] = "Failure. Some parameters are invalid: <ul>"
  		@user.errors.full_messages.each do |error|
  			flash[:form_errors] += "<br/><li>" + error + "</li>"
  		end
  		flash[:form_errors] += "</ul>"

  		render 'new'
  	end
  end

  def edit
    @user = User.find(params[:id])
  end

  private 
	  def user_params
	  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
	  end
end