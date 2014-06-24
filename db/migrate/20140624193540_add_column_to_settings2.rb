class AddColumnToSettings2 < ActiveRecord::Migration
  def change
  	add_column :settings, :display_faq, :integer
  end
end
