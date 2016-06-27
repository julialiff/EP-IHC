class Video < ActiveRecord::Base
  belongs_to :user_id
  belongs_to :party_id
end
