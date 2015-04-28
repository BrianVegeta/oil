class Admin::PhotosController < Admin::ApplicationController

  def create
    
    @admin_photo = Photo.new(admin_photo_params)

    respond_to do |format|
      format.json {
        @admin_photo = Photo.new(admin_photo_params)
        if @admin_photo.save
          render json: {
            thumb: @admin_photo.avatar.url(:thumb),
            medium: @admin_photo.avatar.url(:medium),
            id: @admin_photo.id
          }
        else
          render json: @admin_photo.errors, status: :unprocessable_entity
        end                  
      }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_photo_params
      params.require(:photo).permit(:avatar)
    end
end
