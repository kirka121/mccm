class McMailer < ActionMailer::Base
	default from: DEFAULTFROM

	def contactus(email, name, content)
		@name = name
		@email = email
		@content = content
		@url  = 'http://www.mc-cm.com'
		mail(to: DEVELOPEREMAIL, subject: '[MCCM FEEDBACK] ' + name + " - " + email)
	end

	def invitation(email, name, content)

	end

	def verification(user)
		@email = user.email
		@key = user.activation_key
		@userid = user.id

		mail(to: user.email, subject: '[MCCM VERIFICATION]' + user.first_name + " " + user.last_name)
	end
end