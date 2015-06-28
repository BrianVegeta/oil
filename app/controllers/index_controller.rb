class IndexController < ApplicationController
  layout 'application_index'

  def index
    @wallpapers = Wallpaper.all.where(has_confirmed: true)
    @news = News.limit(10)
  end
end
