class UserEventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.find(params[:id])
    @events = @user.events
  end

  def day_calendar
    @user = User.find(params[:id])
    @events = @user.events
  end

  def list
    @user = User.find(params[:id])
    @events = @user.events.order(start_time: :desc).page(params[:page]).per(10)
  end

  private
    def set_meeting
      @event = Event.find(params[:id])
    end

    def meeting_params
      params.require(:event).permit(:name, :start_time, :recurring, :description)
    end
end
