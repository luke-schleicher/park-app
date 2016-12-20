class RenamePasswordColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :players, :password, :password_digest
  end
end
