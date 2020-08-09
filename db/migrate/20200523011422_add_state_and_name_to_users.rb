class AddStateAndNameToUsers < ActiveRecord::Migration[6.0]
	add_column :users, :name, :string
	add_column :users, :state, :string
end
