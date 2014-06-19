class CarouselImagesController < ApplicationController

	def edit

	end

	def update

	end

	def delete

	end

	def new
		@carousel = CarouselImage.create(carousel_params)
		#@carousel = CarouselImage.new
		#@carousel.attributes = carousel_params

		if(@carousel.save)
			flash.now[:form_success] = "i think the image was saved"
			render 'admins/carouselimages'
		else
			flash.now[:form_errors] = "you done goofed"
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