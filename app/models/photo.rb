class Photo < ActiveRecord::Base
  belongs_to :user
  belongs_to :party
  mount_uploader :pic, PictureUploader
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :party_id, presence: true
  validates :pic, presence: true
end
