class RetweetsController < ApplicationController
  def create
    current_user.retweet(params[:tweet_id])
    redirect_to dashboard_path
  end
end
