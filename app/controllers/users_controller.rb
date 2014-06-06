class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]

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

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:form_success] = "User " + @user.name + " updated successfully."
      redirect_to @user
    else
      flash[:form_errors] = "Failure. Some parameters are invalid: <ul>"
      @user.errors.full_messages.each do |error|
        flash[:form_errors] += "<br/><li>" + error + "</li>"
      end
      flash[:form_errors] += "</ul>"
      render 'edit'
    end
  end

  def admin
    @news = News.find(1)

    if params[:page] != nil
      @page = params[:page]
    end

    if(signed_in?)
      @user = User.find(current_user.id)  
    else
      flash[:form_errors] = "You have to sign in to perform this action."
      redirect_to '/home'
    end
  end

  private 
	  def user_params
	  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
	  end

    def signed_in_user
      unless signed_in?
        flash[:form_errors] = "You have to sign in to perform this action."
        redirect_to signin_url 
      end
    end

    def correct_user
      @user = User.find(params[:id])
      unless current_user?(@user)
        flash[:form_errors] = "You are trying to operate as the wrong user. Contact administration."
        redirect_to(root_url) 
      end
    end
end
