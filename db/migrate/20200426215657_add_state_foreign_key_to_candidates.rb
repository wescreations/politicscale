class AddStateForeignKeyToCandidates < ActiveRecord::Migration[6.0]
  def change
  	add_column :candidates, :state_race_id, :integer
  end
  #add_index("candidates", "state_race_id")
end
