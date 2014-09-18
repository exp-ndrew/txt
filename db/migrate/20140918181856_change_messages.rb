class ChangeMessages < ActiveRecord::Migration
  def change
    remove_column :messages, :from
    remove_column :messages, :to
  end
end
