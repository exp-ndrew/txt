class ChangeToAndFrom < ActiveRecord::Migration
  def change
    remove_column :messages, :to
    remove_column :messages, :from
    add_column :messages, :to, :string
    add_column :messages, :from, :string
  end
end
