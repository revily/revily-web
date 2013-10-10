class ServicesController < ApplicationController
  respond_to :html

  before_action :authenticate!
  before_action :services

  # GET /services
  def index
    @services = services.fetch

    respond_with @services
  end

  # GET /services/1
  def show
    @service = services.find(params[:id])

    respond_with @service
  end

  # GET /services/new
  def new
    @service = services.build

    respond_with @service
  end

  # POST /services
  def create
    @service = services.build(service_params)

    if @service.save
      respond_with @service, notice: 'Service was successfully created.'
    else
      render action: 'new'
    end
  end
  
  # GET /services/1/edit
  def edit
    @service = services.find(params[:id])

    respond_with @service
  end

  # PATCH/PUT /services/1
  def update
    @service = services.find(params[:id])

    if @service.update(service_params)
      respond_with @service, notice: 'Service was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /services/1
  def destroy
    @service = services.find(params[:id])

    @service.destroy
    respond_with @service, notice: 'Service was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def services
      @services = Service.all
    end

    # Only allow a trusted parameter "white list" through.
    def service_params
      params.permit(:name, :config, :events)
    end
end
