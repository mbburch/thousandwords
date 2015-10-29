class TwitterService
  attr_reader :client

  def initialize(user)
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['CONSUMER_KEY']
      config.consumer_secret     = ENV['CONSUMER_SECRET']
      config.access_token        = user.oauth_token
      config.access_token_secret = user.oauth_token_secret
    end
  end

  def home_timeline
    @home_timeline ||= client.home_timeline
  end

  def user
    @user ||= client.user
  end

  def followers
    user.followers_count
  end

  def friends
    user.friends_count
  end

  def tweet_count
    user.tweet_count
  end

  def profile_image
    user.profile_image_url.to_s.sub("_normal.", ".")
  end
end