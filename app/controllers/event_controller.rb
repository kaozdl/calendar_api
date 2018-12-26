class EventController < ApplicationController
  before_action :set_user
  before_action :set_user_calendar
  before_action :set_user_calendar_event, only: [:show, :update, :destroy]
#                   Prefix Verb   URI Pattern   Controller#Action

#user_calendar_event_index GET    /user/:user_id/calendar/:calendar_id/event(.:format)event#index
  def index
    json_response(@calendar.events)
  end

# POST   /user/:user_id/calendar/:calendar_id/event(.:format)event#create
  def create
    @calendar.events.create!(event_params)
    json_response(@calendar, :created)
  end

# user_calendar_event GET    /user/:user_id/calendar/:calendar_id/event/:id(.:format)event#show
  def show
    json_response(@event)
  end

# PUT    /user/:user_id/calendar/:calendar_id/event/:id(.:format)event#update
  def update
    @event.update(event_params)
  end

# DELETE /user/:user_id/calendar/:calendar_id/event/:id(.:format)event#destroy
  def destroy
    @event.destroy
    head :no_content
  end

  private

  def event_params
    params.permit(:name, :description, :date, :reminder)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_user_calendar
    @calendar = @user.calendars.find_by!(id: params[:calendar_id]) if @user
  end

  def set_user_calendar_event
    @event = @calendar.events.find_by!(id: params[:id]) if @calendar
  end
end
