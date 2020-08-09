class AddNewAvatarToNationalRaces < ActiveRecord::Migration[6.0]
  def self.up
    add_attachment :national_races, :avatar
  end

  def self.down
    remove_attachment :national_races, :avatar
  end
end
