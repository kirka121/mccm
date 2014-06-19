module StaticPagesHelper

	def yield_all_faqs
		Faq.all
	end

	def yield_all_carousel_images
		CarouselImage.all
	end
end