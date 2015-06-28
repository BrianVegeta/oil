class CreateWallpapers < ActiveRecord::Migration
  def change
    create_table :wallpapers do |t|
      t.string :title
      t.boolean :has_confirmed, null: false, default: false
      t.attachment :avatar

      t.timestamps
    end
  end
end
