class AddWeightAndPublishedToTheme < ActiveRecord::Migration
  def change
    add_column :themes, :weight, :integer
    add_column :themes, :published, :boolean, default: false
  end
end
