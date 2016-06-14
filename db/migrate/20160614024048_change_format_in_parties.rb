class ChangeFormatInParties < ActiveRecord::Migration
  def up
    change_column :parties, :partytime, :string
  end

  def down
    change_column :parties, :partytime, :datetime
  end
end
