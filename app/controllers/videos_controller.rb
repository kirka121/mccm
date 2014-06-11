class VideosController < ApplicationController

	def index
		@index_page_html  = Settings.find(1).videos_index_description_html
	end

	def show
		@video = Video.find(params[:id])
	end
end