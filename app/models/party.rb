class Party < ActiveRecord::Base
  has_many :checkins
  has_many :users,through: :checkins
  has_many :videos
  has_many :photos
  belongs_to :night_house
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :night_house_id, presence: true
  validates :name,           presence: true
  validates :category,       presence: true
  validates :addinfo,        presence: true
  validates :musicstyle,     presence: true
  validates :partydate,      presence: true
  validates :partytime,      presence: true
end
