class Party < ActiveRecord::Base
  belongs_to :night_house
  default_scope -> { order(created_at: :desc) }
  validates :night_house_id, presence: true
  validates :name, presence: true
  validates :category, presence: true
  validates :addinfo, presence: true
  validates :musicstyle, presence: true
  validates :partydate, presence: true
  validates :partytime, presence: true
end
