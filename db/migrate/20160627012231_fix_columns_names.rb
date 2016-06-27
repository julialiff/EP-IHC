class FixColumnsNames < ActiveRecord::Migration
  def change
    rename_column :videos, :user_id_id, :user_id
    rename_column :videos, :party_id_id, :party_id
  end
end
