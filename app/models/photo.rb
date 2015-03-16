class Photo < ActiveRecord::Base
  has_attached_file :avatar, 
                    :styles => { 
                      :thumb => "100x100^",
                      :small => "200x200^",
                      :medium => "500x500^",
                      :large => "1000x1000^",
                    }, 
                    :default_url => "missing.jpg",
                    # :processors => [:cropper],
                    url: "/assets/splash_images/:id/:style/:basename.:extension",
                    path: ":rails_root/public/assets/splash_images/:id/:style/:basename.:extension"
  
  validates_attachment  :avatar,
                        :content_type => { 
                          :content_type => ["image/jpg", "image/jpeg", "image/gif", "image/png"] 
                        }
  

  DEFAULT_IMG_SRC = 'data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMTkzIiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDE5MyAyMDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjxkZWZzLz48cmVjdCB3aWR0aD0iMTkzIiBoZWlnaHQ9IjIwMCIgZmlsbD0iI0VFRUVFRSIvPjxnPjx0ZXh0IHg9IjcwLjU1NDY4NzUiIHk9IjEwMCIgc3R5bGU9ImZpbGw6I0FBQUFBQTtmb250LXdlaWdodDpib2xkO2ZvbnQtZmFtaWx5OkFyaWFsLCBIZWx2ZXRpY2EsIE9wZW4gU2Fucywgc2Fucy1zZXJpZiwgbW9ub3NwYWNlO2ZvbnQtc2l6ZToxMHB0O2RvbWluYW50LWJhc2VsaW5lOmNlbnRyYWwiPjE5M3gyMDA8L3RleHQ+PC9nPjwvc3ZnPg==' 
end