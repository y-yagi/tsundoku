require 'test_helper'

module BookImporters
  class GihyoDigitalPublishingTest < ActiveSupport::TestCase
    test '.import' do
      user = users(:google)

      assert_difference('Book.count') do
        VCR.use_cassette('GihyoDigitalPublishing.import') do
          BookImporters::GihyoDigitalPublishing.import(
            url: 'https://gihyo.jp/dp/ebook/2016/978-4-7741-8634-4',
            user: user
          )
        end
      end

      book = Book.last
      assert_equal book.user, user
      assert_equal '人工知能の作り方―「おもしろい」ゲームAIはいかにして動くのか', book.title
      assert_equal 'https://gihyo.jp/dp/ebook/2016/978-4-7741-8634-4', book.item_url
      assert_equal 'GihyoDigitalPublishing', book.provider
    end
  end
end
