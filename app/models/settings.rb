class Settings < ActiveRecord::Base
	
	validates :registration_mode, presence: true, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 9 }
	validates :contactus_mode, presence: true, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 9 }
	validates :carousel_mode, presence: true, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 9 }
end
