class CreateParks < ActiveRecord::Migration[5.0]
  def change
    create_table :parks do |t|

      t.string :name
      t.integer :number
      t.string :street_address
      t.integer :zip
      t.float :acres
      t.string :ward
      t.float :long
      t.float :lat 

      t.timestamps
    end
  end
end
