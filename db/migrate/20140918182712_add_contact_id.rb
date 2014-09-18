class AddContactId < ActiveRecord::Migration
  def change
    add_column :messages, :contact_id, :integer
    remove_column :contact_messages, :from_id
    rename_column :contact_messages, :to_id, :contact_id
  end
end
