require 'test_helper'

module BookImporters
  class LambdaNoteTest < ActiveSupport::TestCase
    test '.import' do
      user = users(:google)

      assert_difference('Book.count') do
        VCR.use_cassette('LambdaNote.import') do
          BookImporters::LambdaNote.import(
            url: 'https://www.lambdanote.com/collections/frontpage/products/ruby-ruby',
            user: user
          )
        end
      end

      book = Book.last
      assert_equal book.user, user
      assert_equal 'RubyでつくるRuby ゼロから学びなおすプログラミング言語入門（紙書籍）', book.title
      assert_equal 'https://www.lambdanote.com/collections/frontpage/products/ruby-ruby', book.item_url
      assert_equal 'LambdaNote', book.provider
    end
  end
end
