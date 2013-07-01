class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :url, :limit => 100
      t.string :title
      t.integer :category_id
      t.decimal :price, :precision => 10, :scale => 2
      t.boolean :featured, default: false

      t.timestamps
    end
  end
end
