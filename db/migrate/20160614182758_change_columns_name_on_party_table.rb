class ChangeColumnsNameOnPartyTable < ActiveRecord::Migration
  def change
    rename_column :parties, :add_info, :addinfo
    rename_column :parties, :music_style, :musicstyle
  end
end
