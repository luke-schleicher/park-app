class CreateActivityParks < ActiveRecord::Migration[5.0]
  def change
    create_table :activity_parks do |t|

      t.integer :activity_id
      t.integer :park_id

      t.timestamps
    end
    add_index :activity_parks, [:activity_id, :park_id], unique: true
  end
end
