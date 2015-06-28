class AddSortToWallpaper < ActiveRecord::Migration
  def change
    add_column :wallpapers, :sort, :integer
  end
end
