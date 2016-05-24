class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :users, :birth_date, :birthdate
  end
end
