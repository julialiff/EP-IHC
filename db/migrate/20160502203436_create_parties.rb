class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :name
      t.string :category
      t.string :add_info
      t.string :music_style
      t.integer :NightHouse_id

      t.timestamps null: false
    end
  end
end
