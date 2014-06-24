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

	def staticpages
		@user = current_user
	end
	def carouselimages
		@user = current_user
		@allimages = CarouselImage.paginate(:page => params[:page], :per_page => 5)
	end

	def createcarouselimage
		@allimages = CarouselImage.paginate(:page => params[:page], :per_page => 5)
		@carousel = CarouselImage.new
		render '/admins/admin_subpages/_carousel_create'
	end

	def editcarouselimage
		@allimages = CarouselImage.paginate(:page => params[:page], :per_page => 5)
		@carousel = CarouselImage.new
		render '/admins/admin_subpages/_carousel_edit'
	end

	def dodeletecarouselimage
		@allimages = CarouselImage.paginate(:page => params[:page], :per_page => 5)

		@carousel  = CarouselImage.find_by_id(params[:id])
		 if @carousel.destroy
			flash.now[:form_success] = "Image deleted"
		else
			flash.now[:form_errors] = "Image wasn't deleted"
		end
		render 'admins/carouselimages'
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

	def inviteuser
		email = params["/admin_subpages/inviteusers"][:email]

		@invitation = InvitationsSent.new
		@invitation.confirmation_key = generate_activation_key
		@invitation.email = email
		if @invitation.save
			if McMailer.invitation(email, current_user, @invitation.id, @invitation.confirmation_key).deliver
				flash[:form_success] = "Invitation E-Mail sent to: " + email
			else
				flash[:form_errors]  = "E-Mail failed to send. SMTP error."
			end
		else
			flash[:form_errors] = "Failure. Some parameters are invalid: <ul>"
			@invitation.errors.full_messages.each do |error|
				flash[:form_errors] += "<li>" + error + "</li>"
			end
			flash[:form_errors] += "</ul>"
		end
		render 'inviteusers'
	end

	private 
		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :admin_level, :avatar)
		end

		def user_params_withpw
			params.require(:user).permit(:first_name, :last_name, :email, :admin_level,  :avatar, :password, :password_confirmation)
		end

		def validate_everything
			
		end

		def generate_activation_key
			o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
			string = (0...50).map { o[rand(o.length)] }.join
			#return Digest::MD5.hexdigest(string) if want MD5 the string as well
			return string
		end
end