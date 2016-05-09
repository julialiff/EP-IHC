class AddIndexToNightHousesEmail < ActiveRecord::Migration
  def change
    add_index :night_houses, :email, unique: true
  end
end
