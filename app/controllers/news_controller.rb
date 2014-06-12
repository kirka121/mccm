class NewsController < ApplicationController
	before_action :is_admin?, only: [:create, :edit, :update, :delete]

	def create
		@user = current_user
		@news = News.new

		if @news.update_attributes(news_params)
			#success
			flash[:form_success] = "News were created successfully."
			redirect_to '/admin_subpages/news'
		else
			#failure
			flash.now[:form_errors] = "Failure. Some parameters are invalid: <ul>"
			@news.errors.full_messages.each do |error|
				flash.now[:form_errors] += "<li>" + error + "</li>"
			end
			flash.now[:form_errors] += "</ul>"
			render 'admins/admin_subpages/_news_create'
		end
	end

	def edit
		@news = News.find(params[:id])

		if @news.update_attributes(news_params)
			#success
			flash[:form_success] = "News were edited successfully."
			redirect_to '/admin_subpages/news'
		else
			#failure
			flash.now[:form_errors] = "Failure. Some parameters are invalid: <ul>"
			@news.errors.full_messages.each do |error|
				flash.now[:form_errors] += "<li>" + error + "</li>"
			end
			flash.now[:form_errors] += "</ul>"
			render '/admins/news'
		end
	end

	def update
		flash[:form_success] = 'success'
		redirect_to 'admins/admin_subpages/news'
	end

	def delete
		@user = current_user
		@news = News.find_by_id(params[:id])
		@news.destroy

		flash.now[:form_success] = "News successfully deleted"

		render  'admins/news'
	end

	private 
		def news_params
			params.require(:news).permit(:content, :title, :author, :signature)
		end

		def is_admin?
			if current_user.admin_level != 1
				flash[:form_errors] = "You are not an admin."
				redirect_to root_path
			end
		end
end
