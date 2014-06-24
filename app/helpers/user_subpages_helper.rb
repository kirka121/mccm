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

	def yield_all_videos
		Video.all
	end

	def yield_video_sections
		VideoSection.all
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
end