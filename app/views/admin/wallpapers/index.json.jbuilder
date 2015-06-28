json.array!(@admin_wallpapers) do |admin_wallpaper|
  json.extract! admin_wallpaper, :id
  json.url admin_wallpaper_url(admin_wallpaper, format: :json)
end
