class AddWeightToProducts < ActiveRecord::Migration
  def change
    add_column :products, :weight, :integer, default: 100
  end
end
