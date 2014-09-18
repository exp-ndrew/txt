class DropContactsMessages < ActiveRecord::Migration
  def change
    drop_table :contacts_messages
  end
end
