class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :cellphone
      t.string :photo
      t.string :birth_date
      t.string :occupation
      t.string :college
      t.string :state
      t.string :city
      t.string :neighbourhood

      t.timestamps null: false
    end
  end
end
