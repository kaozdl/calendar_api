# frozen_string_literal: true

class UserController < ApplicationController
  before_action :set_user, only: %i[show update destroy]
  #                   Prefix Verb   URI Pattern                                                                              Controller#Action
  #               user_index GET    /user(.:format)                                                                          user#index
  def index
    @users = User.all
    json_response(@users)
  end

  # user_create POST   /user(.:format)
  def create
    @user = User.create!(user_params)
    json_response(@user, :created)
  end

  # GET    /user/:id(.:format) user#show
  def show
    json_response(@user)
  end

  # PUT    /user/:id(.:format) user#update
  def update
    @user.update(user_params)
    head :no_content
  end

  # DELETE /user/:id(.:format) user#destroy
  def destroy
    @todo.destroy
    head :no_content
  end

  private

  def user_params
    # whitelist params
    params.permit(:name, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
