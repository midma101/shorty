class CreateUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :urls do |t|
      t.string :real_path
      t.string :shorty_path

      t.timestamps
    end
  end
end
