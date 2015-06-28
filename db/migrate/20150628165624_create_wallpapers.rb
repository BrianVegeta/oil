class CreateWallpapers < ActiveRecord::Migration
  def change
    create_table :wallpapers do |t|
      t.string :title
      t.attachment :wallpapers, :avatar

      t.timestamps
    end
  end
end
