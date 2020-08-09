class AddHomeStateToCandidates < ActiveRecord::Migration[6.0]
  def change
  	add_column :candidates, :home_state, :string
  end
end
