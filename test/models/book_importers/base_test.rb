require 'test_helper'

module BookImporters
  class BaseTest < ActiveSupport::TestCase
    test 'provider' do
      assert_equal 'Base', BookImporters::Base.provider
    end
  end
end
