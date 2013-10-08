class SessionsController < ApplicationController
  respond_to :html

  def new
  end

  def create
    if @session = Session.authenticate(session_params[:email], session_params[:password])
      session[:auth_token] = @session.auth_token
      session[:user_id]    = @session.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to root_url, notice: "Logged out!"
  end

  def _inspect
    # render text: "#{(RequestStore.store[:auth_token] || "nada")}"
    respond_with do |format|
      format.html
    end
  end

  private

  def session_params
    params.permit(:email, :password)
  end

end
