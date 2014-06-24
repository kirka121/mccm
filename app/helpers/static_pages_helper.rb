module StaticPagesHelper

	def yield_all_faqs
		Faq.all
	end

	def yield_all_carousel_images
		CarouselImage.all
	end

	def yield_videosections
		if VideoSection.count > 0
			return VideoSection.all
		else
			return false
		end
	end
end