require 'test_helper'

module BookImporters
  class LeanpubTest < ActiveSupport::TestCase
    test '.import' do
      user = users(:google)

      assert_difference('Book.count') do
        VCR.use_cassette('Leanpub.import') do
          BookImporters::Leanpub.import(
            url: 'https://leanpub.com/the-road-to-react-with-firebase',
            user: user
          )
        end
      end

      book = Book.last
      assert_equal book.user, user
      assert_equal 'The Road to React with Firebase', book.title
      assert_equal 'https://leanpub.com/the-road-to-react-with-firebase', book.item_url
      assert_equal 'Leanpub', book.provider
    end
  end
end
