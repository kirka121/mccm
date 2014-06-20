class CreateInvitationsSent < ActiveRecord::Migration
  def change
    create_table :invitations_sents do |t|
    	t.string :email
    	t.text :confirmation_key

    	t.timestamp
    end
  end
end
