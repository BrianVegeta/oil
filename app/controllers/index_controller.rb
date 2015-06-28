class IndexController < ApplicationController
  layout 'application_index'

  def index
    @wallpapers = Wallpaper.all.where(has_confirmed: true)


    top_count = 6
    @products = Product.where(state: :public).order('-top_rate desc').order('id desc').limit(top_count)
    @fixed_products = @products

    if @products.size < top_count
      (1..(top_count - @products.size)).each do |p|
        @fixed_products.push Product.new
      end
    end

    @products = @fixed_products

  end
end
