class Photo < ActiveRecord::Base
  belongs_to :user
  belongs_to :party
  mount_uploader :pic, PictureUploader
end
