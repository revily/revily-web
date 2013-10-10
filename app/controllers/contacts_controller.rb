class ContactsController < ApplicationController
  respond_to :html

  before_action :authenticate!
  before_action :user
  before_action :contacts

  def index
    @contacts = contacts.fetch

    respond_with @contacts
  end

  def show
    @contact = contacts.find(params[:id])

    respond_with @contact
  end

  def new
    @contact = contacts.build

    respond_with @contact
  end

  def create
    @contact = contacts.build(contact_params)
    @contact.save

    respond_with @contact
  end

  def edit
    @contact = contacts.find(params[:id])

    respond_with @contact
  end

  def update
    @contact = contacts.find(params[:id])
    @contact.update_attributes(contact_params)

    respond_with @contact
  end

  def destroy
    @contact = contacts.find(params[:id])
    @contact.destroy

    respond_with @contact
  end

  private

  def user
    @user = User.find(params[:user_id]) if params[:user_id]
  end

  def contacts
    @contacts = @user.contacts
  end
end
