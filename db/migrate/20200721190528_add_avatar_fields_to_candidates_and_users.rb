class AddAvatarFieldsToCandidatesAndUsers < ActiveRecord::Migration[6.0]
  def self.up
    add_attachment :candidates, :avatar
  end

  def self.down
    remove_attachment :candidates, :avatar
  end

  def self.up
    add_attachment :users, :avatar
  end

  def self.down
    remove_attachment :users, :avatar
  end
end
