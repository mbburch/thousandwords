 class User < ActiveRecord::Base
   attr_reader :twitter_client

  def self.from_omniauth(auth_info)
    user = find_or_create_by(uid: auth_info[:uid])

    user.update_attributes(
      name:               auth_info.extra.raw_info.name,
      screen_name:        auth_info.extra.raw_info.screen_name,
      oauth_token:        auth_info.credentials.token,
      oauth_token_secret: auth_info.credentials.secret
    )

    user
  end

  def twitter_client
    @twitter_client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['CONSUMER_KEY']
      config.consumer_secret     = ENV['CONSUMER_SECRET']
      config.access_token        = oauth_token
      config.access_token_secret = oauth_token_secret
    end
  end

  def twitter_timeline
    twitter_client.home_timeline
  end

  def twitter_followers
    twitter_client.followers_count
  end

  def twitter_friends
    twitter_client.friends_count
  end
end
