module ApplicationHelper
	
	def full_title(suffix)
		base_title = Settings.find(1).title.html_safe

		if suffix.empty?
			base_title
		else
			"#{base_title}: #{suffix}"
		end
	end

	def yield_copyright
  		return Settings.find(1).copyright.html_safe
 	end

 	def yield_title
 		return Settings.find(1).title.html_safe
 	end

 	def yield_carousel_mode
		return Settings.find(1).carousel_mode
 	end

 	def yield_registration_mode
		return Settings.find(1).registration_mode
 	end	

 	def yield_contactus_mode
 		return Settings.find(1).contactus_mode
 	end
end
