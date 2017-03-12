require 'test_helper'

module BookImporters
  class PragprogTest < ActiveSupport::TestCase
    test '.import' do
      user = users(:google)

      assert_difference('Book.count') do
        VCR.use_cassette('Pragprog.import') do
          BookImporters::Pragprog.import(
            url: 'https://pragprog.com/book/lmuse2/designed-for-use-second-edition',
            user: user
          )
        end
      end

      book = Book.last
      assert_equal book.user, user
      assert_equal 'Designed for Use, Second Edition: Create Usable Interfaces for Applications and the Web', book.title
      assert_equal 'https://pragprog.com/book/lmuse2/designed-for-use-second-edition', book.item_url
      assert_equal 'Pragprog', book.provider
    end
  end
end
