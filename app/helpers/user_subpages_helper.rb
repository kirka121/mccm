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

	def form_error(string)
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
end