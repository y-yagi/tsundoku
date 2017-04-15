require 'test_helper'

module BookImporters
  class BoothTest < ActiveSupport::TestCase
    test '.import' do
      user = users(:google)

      assert_difference('Book.count') do
        VCR.use_cassette('Booth.import') do
          BookImporters::Booth.import(
            url: 'https://tk-rabbit-house.booth.pm/items/489874',
            user: user
          )
        end
      end

      book = Book.last
      assert_equal book.user, user
      assert_equal 'Modern JavaScript', book.title
      assert_equal 'https://tk-rabbit-house.booth.pm/items/489874', book.item_url
      assert_equal 'Booth', book.provider
    end
  end
end
