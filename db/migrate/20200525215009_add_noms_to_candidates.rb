class AddNomsToCandidates < ActiveRecord::Migration[6.0]
  def change
  	add_column :candidates, :dem_nom, :boolean, default: false
  	add_column :candidates, :repub_nom, :boolean, default: false
  end
end
