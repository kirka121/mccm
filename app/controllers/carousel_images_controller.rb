class CarouselImagesController < ApplicationController

	def edit

	end

	def update

	end

	def delete

	end

	def new
		@carousel = CarouselImage.create(carousel_params)
		@allimages = CarouselImage.paginate(:page => params[:page], :per_page => 5)


		if(@carousel.save)
			flash.now[:form_success] = "The image has been saved."
			render 'admins/carouselimages'
		else
			flash.now[:form_errors] = "There was an error. The image was not saved."
			render 'admins/carouselimages'
		end
	end

	def show

	end

	private
		def carousel_params
		  	params.require(:carousel_image).permit(:image, :author)
		end
end