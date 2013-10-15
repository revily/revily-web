class ScheduleLayersController < ApplicationController
  respond_to :html

  before_action :authenticate!
  before_action :schedule
  before_action :schedule_layers

  def index
    @schedule_layers = schedule_layers.page(params[:page])

    respond_with @schedule_layers
  end

  def show
    @schedule_layer = schedule_layers.find(params[:id])

    respond_with @schedule_layer
  end

  def new
    @schedule_layer = schedule_layers.build

    respond_with @schedule_layer
  end

  def create
    @schedule_layer = schedule_layers.build(schedule_layer_params)
    @schedule_layer.save

    respond_with @schedule_layer
  end

  def edit
    @schedule_layer = schedule_layers.find(params[:id])

    respond_with @schedule_layer
  end

  def update
    @schedule_layer = schedule_layers.find(params[:id])
    @schedule_layer.update_attributes(schedule_layer_params)

    respond_with @schedule_layer
  end

  def destroy
    @schedule_layer = schedule_layers.find(params[:id])
    @schedule_layer.destroy

    respond_with @schedule_layer
  end

  private

  def schedule
    @schedule = Schedule.find(params[:schedule_id]) if params[:schedule_id]
  end

  def schedule_layers
    @schedule_layers = @schedule.schedule_layers
  end
end
