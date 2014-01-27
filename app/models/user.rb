class User < ActiveRecord::Base
	before_save { self.email = email.downcase }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :name, presence: true, uniqueness: true, length: { minimum: 5, maximum: 50 }
	validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 8, maximum: 150 }, format: { with: VALID_EMAIL_REGEX }
	validates :password, presence: true, length: { minimum: 5, maximum: 50 }

	has_secure_password

end
