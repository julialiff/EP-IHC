class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.references :user, index: true, foreign_key: true
      t.references :party, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :checkins, [:user_id, :created_at]
    add_index :checkins, [:party_id, :created_at]
  end
end
