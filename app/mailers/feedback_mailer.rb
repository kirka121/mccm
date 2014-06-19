class FeedbackMailer < ActionMailer::Base
	default from: 'admin@mc-cm.com'

	def contactus(email, name, content)
		@name = name
		@email = email
		@content = content
		@url  = 'http://example.com'
		mail(to: 'kirka121@gmail.com', subject: '[MCCM FEEDBACK] ' + name + " - " + email)
	end
end