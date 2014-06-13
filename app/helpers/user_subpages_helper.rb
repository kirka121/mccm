module UserSubpagesHelper

	def load_title
		News.find(1).title
	end

	def yield_a_new(id)
		News.find(id)
	end

	def yield_all_news
		News.all
	end

	def admin_lvl?
		#0 == nothing
		#1 == full admin

		if current_user.admin_level == 1
			return true
		else
			return false
		end
	end

	def form_alert(string)
		mystring = "<table class='custom_form_alert'><tr><td id='image'>" 
		mystring += image_tag("popupalertimage.png", width: '40px', height: '40px')
		mystring += "</td><td id='header'>"
		mystring += "Alert:"
		mystring += "</td><td id='content'>" 
		mystring += string 
		mystring += "</td></tr></table>"
		return mystring.html_safe
	end

	def form_error(string)
		mystring = "<table class='custom_form_error'><tr><td id='image'>" 
		mystring += image_tag("crossfailureimage.png", width: '40px', height: '40px')
		mystring += "</td><td id='header'>"
		mystring += "Error:"
		mystring += "</td><td id='content'>" 
		mystring += string 
		mystring += "</td></tr></table>"
		return mystring.html_safe
	end

	def form_success(string)
		mystring = "<table class='custom_form_success'><tr><td id='image'>" 
		mystring += image_tag("checkmarksuccessimage.png", width: '40px', height: '40px')
		mystring += "</td><td id='header'>"
		mystring += "Success:"
		mystring += "</td><td id='content'>" 
		mystring += string 
		mystring += "</td></tr></table>"
		return mystring.html_safe
	end
end