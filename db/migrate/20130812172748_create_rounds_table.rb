class CreateRoundsTable < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.belongs_to :player
      t.belongs_to :game
    end
  end
end
