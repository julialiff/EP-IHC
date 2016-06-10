class NightHouse < ActiveRecord::Base
  before_save { email.downcase! }
  validates :name,  presence: true, length: { maximum: 50 }
  validates :cnpj, presence: true
  validates :category, presence: true
  validates :state, presence: true
  validates :city, presence: true
  validates :neighbourhood, presence: true
  validates :address, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_many :parties
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  # Returns the hash digest of the given string.
  def NightHouse.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
