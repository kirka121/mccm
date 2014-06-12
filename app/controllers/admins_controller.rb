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
		@set = Settings.find(1)
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

	def createnews
		@user = current_user
		@news = News.new

		render 'admins/admin_subpages/_news_create'
	end

	def editnews
		@user = current_user
		@news = News.find(params[:id])

		render 'admins/admin_subpages/_news_edit'
	end
end