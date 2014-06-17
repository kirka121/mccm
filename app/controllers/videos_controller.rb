class VideosController < ApplicationController

	def index
		@index_page_html  = Settings.find(1).videos_index_description_html
	end

	def show
		@video = Video.find(params[:id])
	end

	def update
		settings = Settings.find(1)
		settings.videos_index_description_html = params['/admin_subpages/videos'][:myvideosindex].html_safe.to_s


		if settings.save!
			flash[:form_success] = "Videos index static page has been updated successfully."
			redirect_to '/admin_subpages/videos'
		else
			flash[:form_errors] = "Failure to submit form."
			redirect_to '/admin_subpages/videos'
		end
	end
end