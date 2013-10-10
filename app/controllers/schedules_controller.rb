class SchedulesController < ApplicationController
  respond_to :html

  before_action :authenticate!
  before_action :schedules

  # GET /schedules
  def index
    @schedules = schedules.fetch

    respond_with @schedules
  end

  # GET /schedules/1
  def show
    @schedule = schedules.find(params[:id])

    respond_with @schedule
  end

  # GET /schedules/new
  def new
    @schedule = schedules.build

    respond_with @schedule
  end

  # POST /schedules
  def create
    @schedule = schedules.build(schedule_params)

    if @schedule.save
      respond_with @schedule, notice: 'Schedule was successfully created.'
    else
      render action: 'new'
    end
  end
  
  # GET /schedules/1/edit
  def edit
    @schedule = schedules.find(params[:id])

    respond_with @schedule
  end

  # PATCH/PUT /schedules/1
  def update
    @schedule = schedules.find(params[:id])

    if @schedule.update(schedule_params)
      respond_with @schedule, notice: 'Schedule was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /schedules/1
  def destroy
    @schedule = schedules.find(params[:id])

    @schedule.destroy
    respond_with @schedule, notice: 'Schedule was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def schedules
      @schedules = Schedule.all
    end

    # Only allow a trusted parameter "white list" through.
    def schedule_params
      params.permit(:name, :config, :events)
    end
end
