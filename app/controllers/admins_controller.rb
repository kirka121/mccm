class AdminsController < ApplicationController
	def index
		@user = current_user
	end
	def news
		@user = current_user
		@news = News.new
	end
end