class AddColumnsToUsers < ActiveRecord::Migration
	def change
	  	add_column :users, :needs_activation, :integer
		add_column :users, :activation_key, :text
	end
end
