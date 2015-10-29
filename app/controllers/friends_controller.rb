class FriendsController < ApplicationController
  def destroy
    current_user.twitter_client.unfollow(params[:id].to_i)
    redirect_to dashboard_path
  end
end


