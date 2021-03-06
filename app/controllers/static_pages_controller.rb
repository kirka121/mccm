class StaticPagesController < ApplicationController
	def home
		@home_page_content = StaticPage.find(1).content
	end
	
	def presentations
	end

	def datasheets
	end

	def results
	end

	def help
	end

	def about
	end

	def index
	end

	def verifyaccount
		@user = params[:usr]
		@key = params[:id]

		theuser = User.find_by_id(@user)
		if theuser != nil
			if theuser.activation_key == @key
				theuser.needs_activation = false
				theuser.activation_key = 'activated'
				theuser.save
				sign_in theuser
				flash[:form_success] = "Activation is complete."
				redirect_to theuser
			else
				flash[:form_errors] = "Activation has failed. Please contact system administration."
				redirect_to root_url
			end
		end
	end

	def inviteaccount
		@id = params[:id]
		@key = params[:key]

		@theuser = User.new
		theinvite = InvitationsSent.find_by_id(@id)

		if @theuser != nil && theinvite != nil
			if theinvite.confirmation_key == @key
				@theuser.needs_activation = false;
				@theuser.activation_key = 'activated'
				@theuser.email = theinvite.email
				@result = 'success'
				render 'users/new', locals: {thisisaninvite: "wearebeinginvited", :inviteid =>  theinvite.id.to_s}
			end
		end
		
	end

	def send_feedback
		email = params["/help"][:email]
		name = params["/help"][:name]
		content = params["/help"][:content]
		proj_name = params["/help"][:proj_name]

		if McMailer.contactus(email,name,content,proj_name).deliver
			flash[:form_success] = "Your E-Mail has been sent."
			render 'help'
		else
			flash[:form_errors] = "Your E-Mail failed to send."
			render 'help'
		end
	end
end
