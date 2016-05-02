class CreateNightHouses < ActiveRecord::Migration
  def change
    create_table :night_houses do |t|
      t.string :name
      t.string :cnpj
      t.string :email
      t.string :category
      t.string :state
      t.string :city
      t.string :neighbourhood
      t.string :address

      t.timestamps null: false
    end
  end
end
