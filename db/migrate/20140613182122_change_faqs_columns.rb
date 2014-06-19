class ChangeFaqsColumns < ActiveRecord::Migration
  def change
  	remove_column :faqs, :question
  	remove_column :faqs, :answer

  	add_column :faqs, :question, :text
  	add_column :faqs, :answer, :text
  end
end
