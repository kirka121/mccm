module ApplicationHelper

	def title_helper(suffix)
		if suffix.empty?
			suffix = "Home"
		end
		"MC Countermeasures Inc. - " + suffix
	end
end
