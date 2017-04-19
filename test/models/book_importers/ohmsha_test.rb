require 'test_helper'

module BookImporters
  class OhmshaTest < ActiveSupport::TestCase
    test '.import' do
      user = users(:google)

      assert_difference('Book.count') do
        VCR.use_cassette('Ohmsha.import') do
          BookImporters::Ohmsha.import(
            url: 'https://estore.ohmsha.co.jp/titles/978427421483P',
            user: user
          )
        end
      end

      book = Book.last
      assert_equal book.user, user
      assert_equal 'ユーザビリティエンジニアリング 第2版 ユーザエクスペリエンスのための調査、設計、評価手法', book.title
      assert_equal 'https://estore.ohmsha.co.jp/titles/978427421483P', book.item_url
      assert_equal 'Ohmsha', book.provider
    end
  end
end
