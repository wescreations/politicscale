class AddScoreToCandidates < ActiveRecord::Migration[6.0]
  def change
   	add_column :candidates, :score, :float
  end
end
