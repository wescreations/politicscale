class AddNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.string :message
      t.string :message_type
      t.string :link_path
      t.integer :user_id
      t.boolean :read, default: false
      t.timestamps
    end
    add_index(:notifications, :user_id)
  end
end