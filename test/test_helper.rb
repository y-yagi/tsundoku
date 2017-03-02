ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

OmniAuth.config.test_mode = true
OmniAuth.config.add_mock(:google_oauth2,
  'uid' => '1',
  'provider' => 'google_oauth2',
)

VCR.configure do |config|
  config.cassette_library_dir = 'test/vcr_cassettes'
  config.hook_into :webmock
  config.allow_http_connections_when_no_cassette = true
  config.default_cassette_options = {
    match_requests_on: [:method, :host, :path]
  }
end
