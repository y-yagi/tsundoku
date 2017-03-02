require "test_helper"
require "capybara/poltergeist"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :poltergeist

  def login
    visit '/auth/google_oauth2'
  end
end
