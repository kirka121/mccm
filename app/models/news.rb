class News < ActiveRecord::Base	
	validates :title, presence: true, length: { minimum: 4, maximum: 500 }
	validates :content, presence: true, length: { minimum: 4, maximum: 50000 }

end
