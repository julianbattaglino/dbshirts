class AddIndexes < ActiveRecord::Migration
  def change
    add_index :products, :weight, name: 'products_weight_index'
    add_index :themes, :weight, name: 'themes_weight_index'
  end
end
