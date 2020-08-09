class AddAvatarFieldsToCandidates < ActiveRecord::Migration[6.0]
  def self.up
    add_attachment :candidates, :avatar
  end

  def self.down
    remove_attachment :candidates, :avatar
  end
end
