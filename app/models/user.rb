class User < ActiveRecord::Base
  before_save { email.downcase! }
	validates :name,  presence: true, length: { maximum: 50 }
  validates :cellphone, presence: true
  validates :birth_date, presence: true
  validates :occupation, presence: true
  validates :college, presence: true
  validates :state, presence: true
  validates :city, presence: true
  validates :neighbourhood, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
	has_many :parties
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end