class AddPasswordDigestToNightHouses < ActiveRecord::Migration
  def change
    add_column :night_houses, :password_digest, :string
  end
end
