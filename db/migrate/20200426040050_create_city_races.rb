class CreateCityRaces < ActiveRecord::Migration[6.0]
  def change
    create_table :city_races do |t|
      t.string :previously_held_by
      t.string :office, :null => false
      t.string :democratic_nominee
      t.string :dems_running
      t.string :republican_nominee
      t.string :incumbent
      t.string :repubs_running
      t.integer :num_of_dems
      t.integer :num_of_repubs
      t.string :past_elections
      t.integer :salary
      t.datetime :election_date, :null => false
      t.datetime :next_debate

      t.timestamps
    end
  end
end
