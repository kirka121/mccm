class AdminsController < ApplicationController
	def index
		@user = current_user
	end

	def news
		@user = current_user
		@news = News.new
	end

	def settings
		@user = current_user
	end

	def videos
		@user = current_user
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
	end

	def placeholder
		@user = current_user
		@testing = 'this is placeholder'
	end	
end