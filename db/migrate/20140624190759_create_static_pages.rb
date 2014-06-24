class CreateStaticPages < ActiveRecord::Migration
  def change
    create_table :static_pages do |t|
    	t.string :title
    	t.string :author
    	t.text :content

    	t.timestamp
    end
  end
end
