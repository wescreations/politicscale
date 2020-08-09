class AddRaceId2ToCandidates < ActiveRecord::Migration[6.0]
  def change
  	add_column :candidates, :state_race_id2, :integer
  	add_column :candidates, :city_race_id2, :integer
  	add_column :candidates, :national_race_id2, :integer
  end
  #add_index("candidates", "state_race_id2")
  #add_index("candidates", "city_race_id2")
  #add_index("candidates", "national_race_id2")
end
