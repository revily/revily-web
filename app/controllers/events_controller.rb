class EventsController < ApplicationController
  respond_to :html

  before_action :authenticate!
  before_action :events

  # GET /events
  def index
    @events = events.fetch

    respond_with @events
  end

  # GET /events/1
  def show
    @event = events.find(params[:id])

    respond_with @event
  end

  private
  
  # Use callbacks to share common setup or constraints between actions.
  def events
    @events = Event.all
  end
end
