class CarouselImage < ActiveRecord::Base
	has_attached_file :image, :styles => { :fit => "960x300>" }, :url => "/system/carousel/:style/:basename.:extension", :default_style => :fit, :path => ":rails_root/public/system/carousel/:style/:basename.:extension", :default_url => "/system/carousel/default/:style/missing.jpg"
  	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end