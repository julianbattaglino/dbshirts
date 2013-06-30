class CreateProductPhotos < ActiveRecord::Migration
  def change
    create_table :product_photos do |t|
      t.string :product_id
			t.attachment :photo
      t.timestamps
    end
  end
end
