class AddDefaultValueToTracks < ActiveRecord::Migration
  def change
    change_column :tracks, :views, :integer, default: 0
  end
end
