class AddNightHouseRefToParties < ActiveRecord::Migration
  def up
    remove_column :parties, :NightHouse_id
  end

  def down
    remove_column :parties, :NightHouse_id
  end

  def change
    add_reference :parties, :night_house, index: true
  end
end
