class CreateVideoSections < ActiveRecord::Migration
  def change
    create_table :video_sections do |t|
    	t.string :title

      	t.timestamps
    end
  end
end
