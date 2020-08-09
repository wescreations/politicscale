class AddStateToStateRaces < ActiveRecord::Migration[6.0]
  def change
  	add_column :state_races, :state, :string
  end
end