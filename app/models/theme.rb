class Theme < ActiveRecord::Base
  attr_accessible :description, :title, :published, :weight
  has_many :products

  def to_param 
    "#{id}-#{title}".parameterize
  end
end
