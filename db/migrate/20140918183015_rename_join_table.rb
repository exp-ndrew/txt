class RenameJoinTable < ActiveRecord::Migration
  def change
    rename_table :contact_messages, :contacts_messages
  end
end
