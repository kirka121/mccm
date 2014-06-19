class CreateCarouselImages < ActiveRecord::Migration
  def change
    create_table :carousel_images do |t|
    	t.attachment :image
    	t.string :author

      t.timestamps
    end
  end
end
