class AddRememberDigestToNightHouses < ActiveRecord::Migration
  def change
    add_column :night_houses, :remember_digest, :string
  end
end
