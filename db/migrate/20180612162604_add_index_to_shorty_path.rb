class AddIndexToShortyPath < ActiveRecord::Migration[5.2]
  def change
    add_index :urls, :shorty_path, unique: true
  end
end
