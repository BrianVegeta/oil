class Admin::WallpapersController < Admin::ApplicationController
  before_action :set_wallpaper, only: [:show, :edit, :update, :destroy]

  # GET /admin/wallpapers
  # GET /admin/wallpapers.json
  def index
    @wallpapers = Wallpaper.all.where(has_confirmed: true)
  end

  # GET /admin/wallpapers/1
  # GET /admin/wallpapers/1.json
  def show
  end

  # GET /admin/wallpapers/new
  def new
    @wallpaper = Wallpaper.new
  end

  # GET /admin/wallpapers/1/edit
  def edit
  end

  # POST /admin/wallpapers
  # POST /admin/wallpapers.json
  def create
    respond_to do |format|
      format.html {
        raise 'error'
      }

      format.js {
        @wallpaper = Wallpaper.new(wallpaper_image_params)

        if @wallpaper.save
          render json: {
            action: admin_wallpaper_path(@wallpaper),
            thumb: @wallpaper.avatar.url(:thumb),
            medium: @wallpaper.avatar.url(:medium),
            large: @wallpaper.avatar.url(:large)
          }
        else
          render json: @wallpaper.errors, status: :unprocessable_entity
        end

      }

    end
  end

  # PATCH/PUT /admin/wallpapers/1
  # PATCH/PUT /admin/wallpapers/1.json
  def update

    respond_to do |format|
      format.js {
        if @wallpaper.update(wallpaper_image_params)
          render json: {
            action: admin_wallpaper_path(@wallpaper),
            thumb: @wallpaper.avatar.url(:thumb),
            medium: @wallpaper.avatar.url(:medium),
            large: @wallpaper.avatar.url(:large)
          }
        else
          render json: @wallpaper.errors, status: :unprocessable_entity
        end

      }

      format.html {
        if @wallpaper.update(wallpaper_params)
          redirect_to admin_wallpapers_path, notice: '已增加新封面。'
        else
          redirect_to new_admin_wallpaper_path, notice: '更新失敗!'
        end
      }
    end
  end

  # DELETE /admin/wallpapers/1
  # DELETE /admin/wallpapers/1.json
  def destroy
    @wallpaper.destroy
    respond_to do |format|
      format.html {
        redirect_to admin_wallpapers_path, notice: '封面已成功刪除。'
      }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wallpaper
      @wallpaper = Wallpaper.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wallpaper_params
      params.require(:wallpaper).permit(:title)
    end

    def wallpaper_image_params
      params.require(:wallpaper).permit(:avatar)
    end
end
