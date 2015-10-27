Rails.application.config.middleware.use OmniAuth::Builder do
  provider :instagram, ENV['CLIENT_ID'], ENV['CLIENT_SECRET']
end

