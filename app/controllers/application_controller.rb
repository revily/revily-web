class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  before_action :set_access_token
  
  protected

  def authenticate!
    redirect_to sign_in_url, alert: "You must be logged in first" if current_user.nil?
  end

  def set_access_token
    RequestStore.store[:access_token] ||= session[:access_token]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user?
    !!current_user
  end

  # def access_token
    # @access_token ||= RequestStore.store[:access_token]
  # end

  # def access_token=(token)
    # RequestStore.store[:access_token] ||=
  # end
end
