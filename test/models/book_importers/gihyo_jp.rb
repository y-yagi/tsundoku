require 'test_helper'

module BookImporters
  class GihyoJpTest < ActiveSupport::TestCase
    test '.import' do
      user = users(:google)

      assert_difference('Book.count') do
        VCR.use_cassette('GihyoJp.import') do
          BookImporters::GihyoJp.import(
            url: 'http://gihyo.jp/book/2017/978-4-7741-8977-2',
            user: user
          )
        end
      end

      book = Book.last
      assert_equal book.user, user
      assert_equal 'パーフェクトシリーズ改訂2版 パーフェクトRuby', book.title
      assert_equal 'http://gihyo.jp/book/2017/978-4-7741-8977-2', book.item_url
      assert_equal 'GihyoJp', book.provider
    end
  end
end
