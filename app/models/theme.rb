class Theme < ActiveRecord::Base
  attr_accessible :description, :title, :published, :weight
  has_many :products

  def to_param 
    "#{id}-#{title}".parameterize
  end

  def products_by_weight
    Product.find_all_by_theme_id(self.id, order: 'weight ASC' )
  end

  def product_first
    Product.find_by_theme_id(self.id, order: 'weight ASC' )
  end
end
