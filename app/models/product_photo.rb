class ProductPhoto < ActiveRecord::Base
  attr_accessible :product_id, :photo
  has_attached_file :photo, :styles => { medium: "300x300#", small: "160x160#", thumb: "75x75#"  }
  belongs_to :product
end
