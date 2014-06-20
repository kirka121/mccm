class InvitationsSent < ActiveRecord::Base
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :email, presence: true,  length: { minimum: 8, maximum: 150 }, format: { with: VALID_EMAIL_REGEX }
end