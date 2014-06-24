module ApplicationHelper
	
	@thissettings

	def init
		if @thissettings == nil
 			@thissettings = Settings.find(1)
 		end
	end

	def full_title(suffix)
		init
		base_title = @thissettings.title.html_safe

		if suffix.empty?
			base_title
		else
			"#{base_title}: #{suffix}"
		end
	end

	def yield_copyright
		init
  		return @thissettings.copyright.html_safe
 	end

 	def yield_title
 		init
 		return @thissettings.title.html_safe
 	end

 	def yield_carousel_mode
 		init
		return @thissettings.carousel_mode
 	end

 	def yield_registration_mode
 		init
 		return @thissettings.registration_mode
 	end	

 	def yield_contactus_mode
 		init
 		return @thissettings.contactus_mode
 	end

 	def yield_website_settings_moto
 		init
 		return @thissettings.moto
 	end

 	def yield_faq_displaymode
 		init
 		return @thissettings.display_faq
 	end

 	def yield_settings
 		init
 		return @thesettings
 	end

 	def controller?(*controller)
	    controller.include?(params[:controller])
	end

	def action?(*action)
	    action.include?(params[:action])
	end

 	def current_page?(provider)
		if request.fullpath.include? provider
			return true
		else
			return false
		end
	end

	def ishomepage?
		if request.fullpath.include? 'home'
			return true
		else
			return false
		end
	end

	def form_alert(string)
		mystring = "<div class='alert alert-info alert-dismissable'>" 
		mystring += image_tag("popupalertimage.png", width: '40px', height: '40px', id: 'image')
		mystring += "<span class='header'>" + "Alert: " +"</span>"
		mystring += "<span class='content'>" + string +"</span>"
		mystring += "<button type='button' class='close' data-dismiss='alert'aria-hidden='true'>&times;</button>"
		mystring += "</div>"
		return mystring.html_safe
	end

	def form_warning(string)
		mystring = "<div class='alert alert-warning alert-dismissable'>" 
		mystring += image_tag("warningicon.png", width: '40px', height: '40px', id: 'image')
		mystring += "<span class='header'>" + "Warning: " +"</span>"
		mystring += "<span class='content'>" + string +"</span>"
		mystring += "<button type='button' class='close' data-dismiss='alert'>&times;</button>"
		mystring += "</div>"
		return mystring.html_safe
	end

	def form_errors(string)
		mystring = "<div class='alert alert-danger alert-dismissable'>" 
		mystring += image_tag("crossfailureimage.png", width: '40px', height: '40px', id: 'image')
		mystring += "<span class='header'>" + "Error: " +"</span>"
		mystring += "<span class='content'>" + string +"</span>"
		mystring += "<button type='button' class='close' data-dismiss='alert'aria-hidden='true'>&times;</button>"
		mystring += "</div>"
		return mystring.html_safe
	end

	def form_success(string)
		mystring = "<div class='alert alert-success alert-dismissable'>" 
		mystring += image_tag("checkmarksuccessimage.png", width: '40px', height: '40px', id: 'image')
		mystring += "<span class='header'>" + "Success: " +"</span>"
		mystring += "<span class='content'>" + string +"</span>"
		mystring += "<button type='button' class='close' data-dismiss='alert'aria-hidden='true'>&times;</button>"
		mystring += "</div>"
		return mystring.html_safe
	end

	def kircapitalize(string)
		string.slice(0,1).capitalize + string.slice(1..-1)
	end

	def kirauthor(user)
		kircapitalize(user.first_name) + " " + kircapitalize(user.last_name)
	end
end
