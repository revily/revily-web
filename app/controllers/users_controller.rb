class UsersController < ApplicationController
  respond_to :html

  before_action :authenticate!
  before_action :users
  
  def index
    @users = users.page(params[:page])

    respond_with @users
  end

  def show
    @user = users.find(params[:id])

    respond_with @user
  end

  def new
    @user = users.build

    respond_with @user
  end

  def create
    @user = users.build(user_params)
    @user.save

    respond_with @user
  end

  def edit
    @user = users.find(params[:id])

    respond_with @user
  end

  def update
    @user = users.find(params[:id])
    @user.update_attributes(user_params)

    respond_with @user
  end

  def destroy
    @user = users.find(params[:id])
    @user.destroy

    respond_with @user
  end

  private

  def users
    @users = User.all
  end

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
