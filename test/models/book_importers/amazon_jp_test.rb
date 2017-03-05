require 'test_helper'

module BookImporters
  class AmazonJpTest < ActiveSupport::TestCase
    test '.import' do
      user = users(:google)

      assert_difference('Book.count') do
        VCR.use_cassette('AmazonJp.import') do
          BookImporters::AmazonJp.import(
            url: 'https://www.amazon.co.jp/dp/B01MU055XH/',
            user: user
          )
        end
      end

      book = Book.last
      assert_equal book.user, user
      assert_equal 'HIGH OUTPUT MANAGEMENT', book.title
      assert_equal 'https://www.amazon.co.jp/dp/B01MU055XH/', book.item_url
      assert_equal 'AmazonJp', book.provider
    end
  end
end
