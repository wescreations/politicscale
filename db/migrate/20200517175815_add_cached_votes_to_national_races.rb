class AddCachedVotesToNationalRaces < ActiveRecord::Migration[6.0]
  def change
    change_table :state_races do |t|
      t.integer :cached_votes_total, default: 0
      t.integer :cached_votes_score, default: 0
      t.integer :cached_votes_up, default: 0
      t.integer :cached_votes_down, default: 0
      t.integer :cached_weighted_score, default: 0
      t.integer :cached_weighted_total, default: 0
      t.float :cached_weighted_average, default: 0.0
    end

    # Uncomment this line to force caching of existing votes
    # Post.find_each(&:update_cached_votes)
  end
end


  def change
    change_table :users do |t|
      t.string :cached_votes_total, default: 0
      t.string :cached_votes_score, default: 0
  end
end