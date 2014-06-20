class McMailer < ActionMailer::Base
	default from: 'admin@mc-cm.com'

	def contactus(email, name, content)
		@name = name
		@email = email
		@content = content
		@url  = 'http://www.mc-cm.com'
		mail(to: 'kirka121@gmail.com', subject: '[MCCM FEEDBACK] ' + name + " - " + email)
	end

	def invitation(email, name, content)

	end

	def verification(user)
		@email = user.email
		@key = user.activation_key

		mail(to: 'kirka121@gmail.com', subject: '[MCCM VERIFICATION]' + user.first_name + " " + user.last_name)
	end
end