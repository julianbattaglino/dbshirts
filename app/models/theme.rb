class Theme < ActiveRecord::Base
  attr_accessible :description, :title, :published, :weight
  has_many :products
  has_many :tracks, as: :trackable

  def to_param 
    "#{id}-#{title}".parameterize
  end

  def viewed
    track = self.tracks.find_or_create_by_day(Time.now.strftime('%m-%d-%y')).increment!(:views)
  end

  def views
    tracks.sum(:views)
  end

  def products_by_weight
    Product.find_all_by_theme_id(self.id, order: 'weight ASC' )
  end

  def product_first
    Product.find_by_theme_id(self.id, order: 'weight ASC' )
  end
end
