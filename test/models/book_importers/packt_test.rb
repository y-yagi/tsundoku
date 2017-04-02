require 'test_helper'

module BookImporters
  class PacktTest < ActiveSupport::TestCase
    test '.import' do
      user = users(:google)

      assert_difference('Book.count') do
        VCR.use_cassette('Packt.import') do
          BookImporters::Packt.import(
            url: 'https://www.packtpub.com/big-data-and-business-intelligence/postgresql-high-performance-cookbook',
            user: user
          )
        end
      end

      book = Book.last
      assert_equal book.user, user
      assert_equal 'PostgreSQL High Performance Cookbook', book.title
      assert_equal 'https://www.packtpub.com/big-data-and-business-intelligence/postgresql-high-performance-cookbook', book.item_url
      assert_equal 'Packt', book.provider
    end
  end
end
