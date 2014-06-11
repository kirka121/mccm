class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
    	t.string :title
    	t.string :author
    	t.string :comments
      t.belongs_to :video_section

      t.timestamps
    end
  end
end
