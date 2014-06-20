class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	before_create { :create_remember_token }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :first_name, presence: true, length: { minimum: 2, maximum: 50 }
	validates :last_name, presence: true, length: { minimum: 2, maximum: 50 }
	validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 8, maximum: 150 }, format: { with: VALID_EMAIL_REGEX }
	validates :password, presence: true, length: { minimum: 5, maximum: 50 }
	validates :avatar, presence: true

	has_secure_password
	has_attached_file :avatar, :styles => { :medium => "300x300>", :small => "100x100>" }, :url => "/system/users/avatars/:id/:style/:basename.:extension", :default_style => :small, :path => ":rails_root/public/system/users/avatars/:id/:style/:basename.:extension", :default_url => "/system/users/avatars/default/:style/missing.png"
  	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.digest(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private
		def create_remember_token
			self.remember_token = User.digest(User.new_remember_token)
		end
end
