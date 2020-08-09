class AddStateToNationalRaces < ActiveRecord::Migration[6.0]
  def change
  	add_column :national_races, :state, :string
  end
end