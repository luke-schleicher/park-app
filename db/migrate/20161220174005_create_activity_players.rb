class CreateActivityPlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :activity_players do |t|

      t.integer :activity_id
      t.integer :player_id

      t.timestamps
    end
    add_index :activity_players, [:activity_id, :player_id], unique: true
  end
end
