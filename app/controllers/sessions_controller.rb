class SessionsController < ApplicationController
  respond_to :html

  skip_before_action :verify_authenticity_token, only: [ :create ]
  before_action :authenticate!, except: [ :new, :create, :_inspect ]

  def new
    redirect_to root_url, alert: "You are already signed in." if current_user?
  end

  def create
    reset_session

    auth = request.env["omniauth.auth"]
    set_access_token_for_session auth.credentials.token

    if user = User.find(auth.uid)
      session[:user_id] = auth.uid
      redirect_to root_url, notice: "Successfully signed in!"
    else
      flash[:alert] = "Invalid email or password."
      render :new
    end
  end

  def destroy
    session.clear
    # session[:access_token] = nil
    # session[:user_id] = nil
    respond_with do |format|
      format.html { redirect_to root_url, notice: "Logged out!" }
    end
  end

  def _inspect
    respond_with do |format|
      format.html
    end
  end

  private

  def session_params
    params.permit(:email, :password)
  end

  def set_access_token_for_session(token)
    RequestStore.store[:access_token] = token
    session[:access_token] = token
  end
  
end
