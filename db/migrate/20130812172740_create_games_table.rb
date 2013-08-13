class CreateGamesTable < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :winner
      t.integer :loser
      t.integer :race_time
      t.timestamps
    end 
  end
end
