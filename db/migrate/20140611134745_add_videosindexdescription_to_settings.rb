class AddVideosindexdescriptionToSettings < ActiveRecord::Migration
  	def change
  		add_column :settings, :videos_index_description_html, :text
 	end
end
