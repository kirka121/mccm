class McMailer < ActionMailer::Base
	default from: DEFAULTFROM

	def contactus(email, name, content)
		@name = name
		@email = email
		@content = content
		@url  = 'http://www.mc-cm.com'
		mail(to: DEVELOPEREMAIL, subject: '[MCCM FEEDBACK] ' + name + " - " + email)
	end

	def invitation(email, user)
		@invitation = InvitationsSent.new
		@invitation.confirmation_key = generate_activation_key
		@invitation.email = email
		@invitation.save

		@user = user
		@email = email

		mail(to: email, subject: '[MCCM] Membership Invitation')
	end

	def verification(user)
		@email = user.email
		@key = user.activation_key
		@userid = user.id

		mail(to: user.email, subject: '[MCCM VERIFICATION]' + user.first_name + " " + user.last_name)
	end

	private 
		def generate_activation_key
			o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
			string = (0...50).map { o[rand(o.length)] }.join
			#return Digest::MD5.hexdigest(string) if want MD5 the string as well
			return string
		end
end