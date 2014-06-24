class AdminsstaticpagesController < ApplicationController

	def home
		@homecontent = StaticPage.find_by(title: 'home')
	end

	def updatehome
		homecontent = StaticPage.find_by(title: 'home')
		homecontent.content = params[:static_page][:content].to_s.html_safe

		if homecontent.save(validate: false)
			flash[:form_success] = "Home Content has been updated."
			redirect_to admin_updatehome_path
		else
			flash[:form_errors] = "Failure. Some parameters are invalid: <ul>"
			homecontent.errors.full_messages.each do |error|
				flash[:form_errors] += "<li>" + error + "</li>"
			end
			flash[:form_errors] += "</ul>"
			redirect_to admin_updatehome_path
		end

	end

	def datasheets

	end

	def about

	end

	def presentations_papers

	end

	def videos
		@user = current_user
		@myvideosindex = Settings.find(1).videos_index_description_html
	end

	def createvideo
		@user = current_user

		@createvideo = Video.new
		render 'adminsstaticpages/forms/_video_create'
	end

	def editvideo
		@user = current_user

		@editvideo = Video.find(params[:id])
		render 'adminsstaticpages/forms/_video_edit'
	end

	def docreatevideo
		@user = current_user

		video = Video.new
		video.attributes = video_params

		if video.save(validate: true)
			flash[:form_success] = "Video has been createvideo."
			redirect_to admin_subpages_staticpages_videos_path
		else
			flash[:form_errors] = "Failure. Some parameters are invalid: <ul>"
			video.errors.full_messages.each do |error|
				flash[:form_errors] += "<li>" + error + "</li>"
			end
			flash[:form_errors] += "</ul>"
			redirect_to admin_subpages_staticpages_videos_path
		end
	end

	def doeditvideo
		@user = current_user

		video = Video.find(params[:id])
		video.attributes = video_params

		if video.save(validate: true)
			flash[:form_success] = "Video has been edited."
			redirect_to admin_subpages_staticpages_videos_path
		else
			flash[:form_errors] = "Failure. Some parameters are invalid: <ul>"
			video.errors.full_messages.each do |error|
				flash[:form_errors] += "<li>" + error + "</li>"
			end
			flash[:form_errors] += "</ul>"
			redirect_to admin_subpages_staticpages_videos_path
		end
	end

	def dodeletevideo
		video = Video.find_by_id(params[:id])
		 if video.destroy
		 	flash[:form_success] = "Video successfully deleted"
		 else
		 	flash[:form_errors] = "Video failed to delete."
		 end

		redirect_to admin_subpages_staticpages_videos_path
	end

	def createsection
		@createsection = VideoSection.new

		render 'adminsstaticpages/forms/_section_create'
	end

	def docreatesection
		section  = VideoSection.new
		section.title= params[:video_section][:title]

		if section.save
			flash[:form_success] = "Created a section"
			redirect_to '/admin_subpages/videos'
		else
			flash[:form_errors] = "Failure. Some parameters are invalid: <ul>"
			section.errors.full_messages.each do |error|
				flash[:form_errors] += "<li>" + error + "</li>"
			end
			flash[:form_errors] += "</ul>"
			@createsection = VideoSection.new
			render 'adminsstaticpages/forms/_section_create' 
		end
	end

	def dodeletesection
		section = VideoSection.find_by_id(params[:id])

		if section.destroy
			flash[:form_success] = "Section deleted"
			redirect_to '/admin_subpages/createsection'
		else
			flash[:form_errors] = "Section did not get deleted"
			render 'adminsstaticpages/forms/_section_create'
		end
	end

	private

		def video_params
			params.require(:video).permit(:title, :author, :comments, :video_section_id, :url)
		end
end