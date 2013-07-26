class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :redirect_to_main_url
  
  helper_method :current_user
  helper_method :current_user_is_admin?
  @title = ''
  
  def redirect_to_main_url
    redirect_to "http://doucheyshirts.com" if request.domain === "doucheyshirt.com"
  end
  
  private
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to root_url
    end
  end

  def logged_in?
    if !!current_user
      return true
    else
      redirect_to "/login"
    end
  end

  def require_admin 
    unless current_user_is_admin?
      flash[:error] = "You do not have access this section"
      redirect_to root_url
    end
  end

  def current_user_is_admin? 
    return true if defined?(current_user.admin) && current_user.admin?
  end 
end
