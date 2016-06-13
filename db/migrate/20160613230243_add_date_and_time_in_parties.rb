class AddDateAndTimeInParties < ActiveRecord::Migration
  def change
    add_column :parties, :partydate, :date
    add_column :parties, :partytime, :datetime
  end
end
