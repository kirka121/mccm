module ApplicationHelper

	def full_title(suffix)
		base_title = "MC Countermeasures Inc."

		if suffix.empty?
			base_title
		else
			"#{base_title} - #{suffix}"
		end
	end
end
