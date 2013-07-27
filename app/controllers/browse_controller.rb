class BrowseController < ApplicationController
  def index
    @categories = Category.all
    @products = Product.includes(:product_photos).order('id DESC').paginate(page: params[:page], :per_page => 24)
    @tags = Product.all_tags
  end

  def show
    @categories = Category.all
    @products = Product.includes(:product_photos).where(category_id: params[:id]).order('id DESC').paginate(page: params[:page], :per_page => 24)
    @tags = Product.all_tags
  end

  def search
    @categories = Category.all
    @products = Product.search params
    @tags = Product.all_tags
    render :action => "index"
  end
end
