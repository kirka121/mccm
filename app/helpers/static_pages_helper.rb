module StaticPagesHelper

	def yield_all_faqs
		Faq.all
	end
end