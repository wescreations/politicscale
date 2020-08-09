class RenameOfficeOnNationalRaces < ActiveRecord::Migration[6.0]
  def change
    rename_column :national_races, :office, :name
  end
end
