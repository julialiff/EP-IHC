class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :pic
      t.references :user, index: true, foreign_key: true
      t.references :party, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :photos, [:user_id, :created_at]
    add_index :photos , [:party_id, :created_at]
  end
end
