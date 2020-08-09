class AddPollsToStateRaces < ActiveRecord::Migration[6.0]
  def change
   	add_column :state_races, :poll, :string
  end
end
