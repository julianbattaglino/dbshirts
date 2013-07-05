class Admin::IndexController < ApplicationController
  before_filter :require_admin
  
  def index
  end
end
