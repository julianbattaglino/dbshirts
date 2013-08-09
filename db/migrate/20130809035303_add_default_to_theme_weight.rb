class AddDefaultToThemeWeight < ActiveRecord::Migration
  def change
    change_column :themes, :weight, :integer, default: 100
  end
end
