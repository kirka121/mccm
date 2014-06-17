class AdminsController < ApplicationController
	before_action :validate_everything, only: [:createnews, :editnews, :createuser, :edituser,  :createvideo, :editvideo,  :docreateuser, :doedituser, :dodeleteuser, :docreatevideo, :doeditvideo] 

	def index
		@user = current_user
	end
	def news
		@user = current_user
		@news = News.new
	end
	def settings
		@user = current_user
		@set = Settings.find(1)
	end
	def videos
		@user = current_user
		@myvideosindex = Settings.find(1).videos_index_description_html
	end
	def results
		@user = current_user
	end
	def presentations
		@user = current_user
	end
	def help
		@user = current_user
	end
	def about
		@user = current_user
	end
	def users
		@user = current_user

		@users = User.all
	end
	def placeholder
		@user = current_user
	end	
	def carouselimages
		@user = current_user
	end





	def createnews
		@user = current_user
		@news = News.new

		render 'admins/admin_subpages/_news_create'
	end

	def editnews
		@user = current_user
		@users = User.all
		@news = News.find(params[:id])

		render 'admins/admin_subpages/_news_edit'
	end

	def createuser
		@user = current_user
		@users = User.all
		@createuser = User.new

		render 'admins/admin_subpages/_user_create'
	end

	def edituser
		@user = current_user
		@users = User.all
		@edituser = User.find(params[:id])

		render 'admins/admin_subpages/_user_edit'
	end

	def createvideo
		@user = current_user

		@createvideo = Video.new
		render 'admins/admin_subpages/_video_create'
	end

	def editvideo
		@user = current_user

		@editvideo = Video.find(params[:id])
		render 'admins/admin_subpages/_video_edit'
	end

	def docreateuser
		@createuser = User.new
		@users = User.all
		@createuser.attributes = user_params_withpw

		if @createuser.save(validate: false)
			flash[:form_success] = "User " + @createuser.first_name + " creates successfully."
			redirect_to '/admin_subpages/users'
		else
			flash[:form_errors] = "Failure. Some parameters are invalid: <ul>"
			@createuser.errors.full_messages.each do |error|
				flash[:form_errors] += "<li>" + error + "</li>"
			end
			flash[:form_errors] += "</ul>"
			render 'admins/admin_subpages/_user_edit'
		end
	end

	def doedituser
		@edituser = User.find(params[:id])
		@users = User.all
		@user = User.find(params[:id])
    		@user.attributes = user_params

		if @user.save(validate: false)
			flash[:form_success] = "User " + @user.first_name + " updated successfully."
			redirect_to '/admin_subpages/users'
		else
			flash[:form_errors] = "Failure. Some parameters are invalid: <ul>"
			@user.errors.full_messages.each do |error|
				flash[:form_errors] += "<li>" + error + "</li>"
			end
			flash[:form_errors] += "</ul>"
			render 'admins/admin_subpages/_user_edit'
		end
	end

	def dodeleteuser
		@users = User.all
		@user = User.find_by_id(params[:id])
		@user.destroy

		flash.now[:form_success] = "User successfully deleted"

		render  'admins/users'
	end

	def docreatevideo
		@user = current_user

		video = Video.new
		video.attributes = video_params

		if video.save(validate: true)
			flash[:form_success] = "Video has been createvideo."
			redirect_to '/admin_subpages/videos'
		else
			flash[:form_errors] = "Failure. Some parameters are invalid: <ul>"
			video.errors.full_messages.each do |error|
				flash[:form_errors] += "<li>" + error + "</li>"
			end
			flash[:form_errors] += "</ul>"
			redirect_to '/admin_subpages/videos'
		end
	end

	def doeditvideo
		@user = current_user

		video = Video.find(params[:id])
		video.attributes = video_params

		if video.save(validate: true)
			flash[:form_success] = "Video has been edited."
			redirect_to '/admin_subpages/videos'
		else
			flash[:form_errors] = "Failure. Some parameters are invalid: <ul>"
			video.errors.full_messages.each do |error|
				flash[:form_errors] += "<li>" + error + "</li>"
			end
			flash[:form_errors] += "</ul>"
			redirect_to '/admin_subpages/videos'
		end
	end

	def dodeletevideo
		video = Video.find_by_id(params[:id])
		 if video.destroy
		 	flash[:form_success] = "Video successfully deleted"
		 else
		 	flash[:form_errors] = "Video failed to delete."
		 end

		redirect_to '/admin_subpages/videos'
	end

	  private 
	  def user_params
	  	params.require(:user).permit(:first_name, :last_name, :email, :admin_level)
	  end

	   def user_params_withpw
	  	params.require(:user).permit(:first_name, :last_name, :email, :admin_level, :password, :password_confirmation)
	  end

	   def video_params
	  	params.require(:video).permit(:title, :author, :comments, :video_section_id)
	  end

	  def validate_everything
	  	
	  end
end