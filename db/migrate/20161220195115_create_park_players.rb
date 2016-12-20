class CreateParkPlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :park_players do |t|

      t.integer :park_id
      t.integer :player_id

      t.timestamps
    end
    add_index :park_players, [:park_id, :player_id], unique: true
  end
end
