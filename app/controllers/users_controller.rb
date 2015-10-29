class UsersController < ApplicationController
  before_action :authorize

  def show
    @twitter_client ||= current_user.twitter_client
  end
end