class AddAvatarToPhoto < ActiveRecord::Migration
  def self.up
    add_attachment :photos, :avatar
    add_column :products, :photo_id, :integer
  end

  def self.down
    remove_attachment :photos, :avatar
    remove_column :products, :photo_id
  end
end
