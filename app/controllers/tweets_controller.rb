class TweetsController < ApplicationController
  def new
    @twitter_client ||= current_user.twitter_client
  end

  def create
    current_user.tweet(params[:tweet])
    redirect_to dashboard_path
  end
end
