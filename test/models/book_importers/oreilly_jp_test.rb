require 'test_helper'

module BookImporters
  class OreillyJpTest < ActiveSupport::TestCase
    test '.import' do
      user = users(:google)

      assert_difference('Book.count') do
        VCR.use_cassette('OreillyJp.import') do
          BookImporters::OreillyJp.import(
            url: 'https://www.oreilly.co.jp/books/9784873117836/',
            user: user
          )
        end
      end

      book = Book.last
      assert_equal book.user, user
      assert_equal '初めてのJavaScript 第3版――ES2015以降の最新ウェブ開発', book.title
      assert_equal 'https://www.oreilly.co.jp/books/9784873117836/', book.item_url
      assert_equal 'OreillyJp', book.provider
    end
  end
end
