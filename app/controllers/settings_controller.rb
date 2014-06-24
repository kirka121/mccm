class SettingsController < ApplicationController
	before_action :is_admin?, only: [:edit, :update]

	def edit
		@user = current_user
	end

	def update
		@user = current_user
		@settings = Settings.find(1)

		if @settings.update_attributes(settings_params)
			#success
		      flash[:form_success] = "Settings were updated successfully."
		      redirect_to '/admin_subpages/settings'
		else
			#failure
		      flash[:form_errors] = "Failure. Some parameters are invalid: <ul>"
			@settings.errors.full_messages.each do |error|
				flash.now[:form_errors] += "<li>" + error + "</li>"
			end
			flash[:form_errors] += "</ul>"
		      @set = @settings
		      render 'admins/settings'
		end
	end

	private 
		def settings_params
			params.require(:settings).permit(:title, :copyright, :carousel_mode, :registration_mode, :contactus_mode, :moto, :admin_email)
		end

		def is_admin?
			if current_user.admin_level != 1
				flash[:form_errors] = "You are not an admin."
				redirect_to root_path
			end
		end
end