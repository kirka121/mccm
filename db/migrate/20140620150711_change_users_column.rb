class ChangeUsersColumn < ActiveRecord::Migration
   def self.up
	execute "ALTER TABLE users DROP COLUMN needs_activation"
  end
end
