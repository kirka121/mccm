class AddColumnsToUsers < ActiveRecord::Migration
	def change
	  	add_column :users, :needs_activation, :bool
		add_column :users, :activation_key, :text
	end
end
