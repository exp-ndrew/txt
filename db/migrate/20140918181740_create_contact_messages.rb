class CreateContactMessages < ActiveRecord::Migration
  def change
    create_table :contact_messages do |t|
      t.integer :message_id
      t.integer :from_id
      t.integer :to_id
    end
  end
end
