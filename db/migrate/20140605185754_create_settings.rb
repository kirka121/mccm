class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
		t.string :title
		t.string :copyright
		t.integer :carousel_mode
		t.integer :registration_mode
		t.integer :contactus_mode

      	t.timestamps
    end
  end
end
