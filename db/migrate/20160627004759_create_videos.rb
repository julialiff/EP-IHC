# class CreateVideos < ActiveRecord::Migration
#   def change
#     create_table :videos do |t|
#       t.string :yturl
#       t.references :user_id, index: true, foreign_key: true
#       t.references :party_id, index: true, foreign_key: true

#       t.timestamps null: false
#     end
#     add_index :videos, [:user_id, :created_at]
#     add_index :videos, [:party_id, :created_at]
#   end
# end
class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :yturl
      t.references :user, index: true, foreign_key: true
      t.references :party, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :videos, [:user_id, :created_at]
    add_index :videos, [:party_id, :created_at]
  end
end
