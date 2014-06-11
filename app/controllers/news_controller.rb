class NewsController < ApplicationController

	def create
		@test = News.new
		@test.title = params[:news][:title]
		@test.content = params[:news][:content]
		@test.author = "kirka"
		@test.signature = "kirka"

		@test.save
	end

	def edit

	end

	def update

	end

	def delete

	end
end
