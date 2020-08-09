class AddForeignKeyToCandidates < ActiveRecord::Migration[6.0]
  def change
  	add_column :candidates, :national_race_id, :integer
  end
  #add_index("candidates", "national_race_id")
end
