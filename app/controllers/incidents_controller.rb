class IncidentsController < ApplicationController
  respond_to :html

  before_action :authenticate!
  before_action :service
  before_action :incidents

  def index
    @incidents = incidents.fetch

    respond_with @incidents
  end

  def show
    @incident = incidents.find(params[:id])

    respond_with @incident
  end

  def new
    @incident = incidents.build

    respond_with @incident
  end

  def create
    @incident = incidents.build(incident_params)
    @incident.save

    respond_with @incident
  end

  private

  def service
    @service = Service.find(params[:service_id]) if params[:service_id]
  end

  def incidents
    @incidents = @service.incidents
  end
end
