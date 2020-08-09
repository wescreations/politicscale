class CreateCandidates < ActiveRecord::Migration[6.0]
  def change
    create_table :candidates do |t|
      t.string  :name
  	  t.string  :office_running_for
  	  t.string  :bio
  	  t.integer :age
    end
  end
end