# frozen_string_literal: true

class CalendarController < ApplicationController
  before_action :set_user
  before_action :set_user_calendar, only: %i[show update destroy]
  # Prefix              Verb    URI Pattern                      Controller#Action
  # user_calendar_index GET    /user/:user_id/calendar(.:format) calendar#index
  def index
    json_response(@user.calendars)
  end

  #                          POST   /user/:user_id/calendar(.:format)calendar#create
  def create
    c = @user.calendars.create!(calendar_params)
    json_response(c, :created)
  end

  #            user_calendar GET    /user/:user_id/calendar/:id(.:format)calendar#show
  def show
    json_response(@calendar)
  end

  #                          PUT    /user/:user_id/calendar/:id(.:format)calendar#update
  def update
    @calendar.update(calendar_params)
    head :no_content
  end

  #                          DELETE /user/:user_id/calendar/:id(.:format)calendar#destroy
  def destroy
    @calendar.destroy
    head :no_content
  end

  private

  def calendar_params
    params.permit(:name)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_user_calendar
    @calendar = @user.calendars.find_by!(id: params[:id]) if @user
  end
end
