class BrowseController < ApplicationController
  def index
    @categories = Category.all
    @products = Product.includes(:product_photos).order('id DESC').paginate(page: params[:page], :per_page => 24)
  end

  def show
    @categories = Category.all
    @products = Product.includes(:product_photos).where(category_id: params[:id]).order('id DESC').paginate(page: params[:page], :per_page => 24)
  end
end
