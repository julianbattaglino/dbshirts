class HomeController < ApplicationController
  def index
    #@products = Product.includes(:product_photos).limit(12).order('featured DESC,id DESC')
    @themes = Theme.includes(:products).find_all_by_published(true, limit: 12)
  end

  def new
    @products = Product.includes(:product_photos).limit(24).order('id DESC').paginate(page: params[:page], :per_page => 24)
    @title = 'new'
  end

  def featured
    @products = Product.includes(:product_photos).where(featured: true).order('id DESC').paginate(page: params[:page], :per_page => 24)
    @title = 'featured'
  end
end
