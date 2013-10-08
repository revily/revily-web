class ContactsController < ApplicationController
  respond_to :html

  before_action :contact
  before_action :contacts

  def index
    @contacts = contacts

    respond_with contacts
  end

  def show
    @contact = contacts.find(params[:id])

    respond_with @contact
  end

  def new
    @contact = contacts.new(contact_params)

    respond_with @contact
  end

  def create
    @contact = contacts.new(contact_params)
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

  def contact
    @contact = User.find(params[:contact_id]) if params[:contact_id]
  end

  def contacts
    @contacts = @contact.contacts
  end
end
