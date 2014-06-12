class NewsController < ApplicationController

	def create
		@news = News.new

		if @news.update_attributes(news_params)
			#success
			flash[:form_success] = "News were created successfully."
			redirect_to '/admin_subpages/news'
		else
			#failure
			flash[:form_errors] = "Failure. Some parameters are invalid: <ul>"
			@news.errors.full_messages.each do |error|
				flash.now[:form_errors] += "<li>" + error + "</li>"
			end
			flash[:form_errors] += "</ul>"
			render '/admins/news'
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
			flash[:form_errors] = "Failure. Some parameters are invalid: <ul>"
			@news.errors.full_messages.each do |error|
				flash.now[:form_errors] += "<li>" + error + "</li>"
			end
			flash[:form_errors] += "</ul>"
			render '/admins/news'
		end
	end

	def update
		flash[:form_success] = 'success'
		redirect_to 'admins/admin_subpages/news'
	end

	def delete

	end

	private 
		def news_params
			params.require(:news).permit(:content, :title, :author, :signature)
		end
end
