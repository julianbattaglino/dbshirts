class Product < ActiveRecord::Base
  attr_accessible :category_id, :price, :title, :url, :product_photos, :product_photos_attributes 
  acts_as_taggable

  belongs_to :category
  has_many :product_photos, :dependent => :destroy

  accepts_nested_attributes_for :product_photos, :reject_if => lambda {|a| a[:photo].blank?} , :allow_destroy => true
  
end
