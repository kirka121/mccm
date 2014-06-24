class AddColumnToSettings < ActiveRecord::Migration
  	def change
  		add_column :settings, :moto, :text
	  	add_column :settings, :server_url, :text
  		add_column :settings, :developer_email, :text
  		add_column :settings, :default_from_email, :text
		add_column :settings, :admin_email, :text
  	end
end
