class AddExpiresAtToUrls < ActiveRecord::Migration[5.2]
  def change
    add_column :urls, :expires_at, :datetime
  end
end
