class AllEventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
  end

  def day_calendar
    @events = Event.all
  end

  def list
    @events = Event.all.order(start_time: :desc).page(params[:page]).per(10)
  end

  private
    def set_meeting
      @event = Event.find(params[:id])
    end

    def meeting_params
      params.require(:event).permit(:name, :start_time, :recurring, :description)
    end
end
