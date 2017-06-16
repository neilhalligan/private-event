class EventsController < ApplicationController
  before_action :authenticate, only: [:new, :create]

  def new
    @event = current_user.hosted_events.build
  end

  def create
    @event = current_user.hosted_events.build(event_params)
    if @event.save
      redirect_to @event
    else
      render :new
    end
  end

  def index
    @future_events = Event.future
    @past_events = Event.past
  end

  def show
    @event = Event.find(params[:id])
    @attendance = Attendance.new
    @inviteable_users = User.all - @event.attendees
  end

  private
    def event_params
      params.require(:event).permit(:description, :date, :location)
    end

    def authenticate
      unless logged_in?
        flash[:info] = "Please log in to create event"
        redirect_to login_path
      end
    end
end
