class ProductPhoto < ActiveRecord::Base
  attr_accessible :product_id, :photo
  has_attached_file :photo, :styles => { large: "350x350#", medium: "230x230#", small: "140x140#", thumb: "75x75#"  }
  belongs_to :product
end
