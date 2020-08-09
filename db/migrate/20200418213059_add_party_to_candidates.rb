class AddPartyToCandidates < ActiveRecord::Migration[6.0]
  def change
  	add_column :candidates, :party, :string
  end
end
