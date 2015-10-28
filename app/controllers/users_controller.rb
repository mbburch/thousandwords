class UsersController < ApplicationController
  before_action :authorize

  def show
    @user = current_user.user
    @statuses = current_user.home_timeline
  end
end