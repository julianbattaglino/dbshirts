class Admin::IndexController < ApplicationController
  before_filter :require_admin
  
  def index
    @themes = Theme.all
    @products = Product.all
  end
end
