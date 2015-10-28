ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'support/database_cleaner'
require 'rspec/rails'
require "capybara/rspec"
require "capybara/rails"
require "simplecov"
require "vcr"
require "webmock"

SimpleCov.start "rails"

ActiveRecord::Migration.maintain_test_schema!

VCR.configure do |config|
  config.cassette_library_dir = "spec/cassettes"
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.filter_sensitive_data('<CONSUMER_KEY>') { ENV['CONSUMER_KEY'] }
  config.filter_sensitive_data('<CONSUMER_SECRET>') { ENV['CONSUMER_SECRET'] }
  config.filter_sensitive_data('<USER_TOKEN>') { ENV['USER_TOKEN'] }
  config.filter_sensitive_data('<USER_SECRET>') { ENV['USER_SECRET'] }
end


RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = false

  config.infer_spec_type_from_file_location!

  config.backtrace_exclusion_patterns << %r{/gems/}

  config.before :each do
    OmniAuth.config.mock_auth[:twitter] = nil
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
          provider: 'twitter',
          uid: ENV['uid'],
          extra: {
            raw_info: {
              name: "MB",
              screen_name: "dirtandgreens"
            }
          },
          credentials: {
            token: ENV['USER_TOKEN'],
            secret: ENV['USER_SECRET']
          }
        })
  end
end
