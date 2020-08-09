class RenameOfficeOnStateRacesToName < ActiveRecord::Migration[6.0]
  def change
     rename_column :state_races, :office, :name
  end
end
