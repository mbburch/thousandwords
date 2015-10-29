class FavoritesController < ApplicationController
  def create
    current_user.favorite(params[:tweet_id])
    redirect_to dashboard_path
  end

  def destroy
    current_user.destroy_favorite(params[:tweet_id])
    redirect_to dashboard_path
  end
end

