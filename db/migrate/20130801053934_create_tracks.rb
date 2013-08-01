class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :views, default: 1
      t.string :ip
      t.integer :trackable_id
      t.string :trackable_type
      t.string :day

      t.timestamps
    end
  end
end
