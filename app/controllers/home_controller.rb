class HomeController < ApplicationController
  def index
    @products = Product.includes(:product_photos).all
  end
end
