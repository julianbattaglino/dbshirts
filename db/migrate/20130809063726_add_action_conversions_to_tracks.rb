class AddActionConversionsToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :conversions, :integer
  end
end
