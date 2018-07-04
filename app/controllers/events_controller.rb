class EventsController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized, except: %i[index show]
  before_action :event_set, only: %i[show edit update destroy]

  def index
    @events = Event.all
    @calendar_events = @events.flat_map { |e| e.calendar_events(params.fetch(:start_date, Time.zone.now).to_date, e.user) }
    authorize @events
  end

  def show; end

  def new
    @event = Event.new
    authorize @event
  end

  def edit; end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    authorize @event

    if @event.save
      flash[:success] = 'Event has been created.'
      redirect_to events_path
    else
      render :new
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event
      flash[:success] = 'Event has been updated.'
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url
    flash[:success] = 'Event has been destroyed.'
  end

  private

  def event_set
    @event = Event.find(params[:id])
    authorize @event
  end

  def event_params
    params.require(:event).permit(:name, :start_time, :recurring, :description)
  end
end
