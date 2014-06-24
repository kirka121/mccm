class McMailer < ActionMailer::Base
	default from: Settings.find(1).default_from_email
	add_template_helper(ApplicationHelper)

	def contactus(email, name, content,proj)
		@name = name
		@email = email
		@content = content
		@proj = proj
		@url  = 'http://www.mc-cm.com'
		mail(to: Settings.find(1).developer_email, subject: '[MCCM FEEDBACK] ' + name + " - " + email)
	end

	def invitation(email, user, id, key)
		@user = user
		@email = email
		@id = id
		@key = key
		mail(to: email, subject: '[MCCM] Membership Invitation')
	end

	def verification(user)
		@email = user.email
		@key = user.activation_key
		@userid = user.id

		mail(to: user.email, subject: '[MCCM VERIFICATION]' + user.first_name + " " + user.last_name)
	end

	def yield_settings
		return Settings.find(1)
	end
end