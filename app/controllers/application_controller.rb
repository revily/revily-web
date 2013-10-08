class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  before_filter :set_auth_token

  protected

  def set_auth_token
    RequestStore.store[:auth_token] = session[:auth_token]
  end

  def current_user
    @user ||= User.find(session[:user_id])
  end

end
