class Wallpaper < ActiveRecord::Base
  default_scope { order('sort ASC').order('id DESC') }
  has_attached_file :avatar,
                    :styles => {
                      :thumb => "200x100^",
                      :medium => "1000x500^",
                      :large => "1600x800^",
                    },
                    :default_url => "missing.jpg",
                    # :processors => [:cropper],
                    url: "/assets/splash_images/wallpaper/:id/:style/:basename.:extension",
                    path: ":rails_root/public/assets/splash_images/wallpaper/:id/:style/:basename.:extension"

  validates_attachment  :avatar,
                        :content_type => {
                          :content_type => ["image/jpg", "image/jpeg", "image/gif", "image/png"]
                        }

  validates_attachment_size :avatar, :in => 0.megabytes..4.megabytes

  DEFAULT_IMAG = 'http://www.tilemountain.co.uk/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/p/r/prismatics_prg6_black_200x100-1600.jpg'

end
