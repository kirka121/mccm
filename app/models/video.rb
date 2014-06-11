class Video < ActiveRecord::Base
	belongs_to :video_section, :inverse_of => :videos

	def create_initial_data
		myvids = VideoSection.new(title: '(PRI) PRED-5A Videos')
		myvids.save
		myvids.videos.create(title: 'one', author: 'kirka', comments: 'some comment here bla bla', url: '/2')
		myvids.videos.create(title: 'two', author: 'kirka', comments: 'more comments here etc', url: '/3')
		myvids.videos.create(title: 'three', author: 'kirka', comments: 'last comment fagget', url: '/4')

		movids = VideoSection.new(title: 'Second section')
		movids.save
		movids.videos.create(title: 'never', author: 'kirka', comments: 'some comment here bla bla', url: '/2')
		movids.videos.create(title: 'fager', author: 'kirka', comments: 'more comments here etc', url: '/3')
		movids.videos.create(title: 'noof', author: 'kirka', comments: 'last comment fagget', url: '/4')
	end
end
