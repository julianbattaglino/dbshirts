class Product < ActiveRecord::Base
  attr_accessible :category_id, :price, :title, :url, :featured ,:product_photos, :product_photos_attributes, :tags, :tag_list
  acts_as_taggable

  belongs_to :category
  has_many :product_photos, :dependent => :destroy

  accepts_nested_attributes_for :product_photos, :reject_if => lambda {|a| a[:photo].blank?} , :allow_destroy => true
  
  def toggle_featured
    if self.featured == false
      self.featured = true
    else
      self.featured = false
    end

    self.save
  end
  def deep_link
    return self.url + "?123"
  end
end
