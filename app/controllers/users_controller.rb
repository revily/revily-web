class UsersController < ApplicationController
  respond_to :html

  before_filter :authenticate!

  def index
    @users = User.all.fetch

    respond_with @users
  end

  def show
    @user = User.find(params[:id])

    respond_with @user
  end

  def new
    @user = User.new(user_params)

    respond_with @user
  end

  def create
    @user = User.new(user_params)
    @user.save

    respond_with @user
  end

  def edit
    @user = User.find(params[:id])

    respond_with @user
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)

    respond_with @user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_with @user
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
