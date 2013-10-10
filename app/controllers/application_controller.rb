class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  before_action :set_auth_token
  
  protected

  def authenticate!
    redirect_to sign_in_url, alert: "You must be logged in first" if current_user.nil?
  end

  def set_auth_token
    RequestStore.store[:auth_token] = session[:auth_token]
  end

  def current_user
    @user ||= User.find(session[:user_id])
  end

  def current_user?
    !!current_user
  end
end
