class Party < ActiveRecord::Base
  belongs_to :night_house
  default_scope -> { order(created_at: :desc) }
  validates :NightHouse_id, presence: true
  validates :name, presence: true
end
