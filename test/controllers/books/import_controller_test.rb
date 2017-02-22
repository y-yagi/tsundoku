require 'test_helper'

class Books::ImportControllerTest < ActionController::TestCase
  setup do
    session[:user_id] = users(:google).id
  end

  test 'import from OreillyJp' do
    assert_difference('Book.count') do
      post :create, params: { url: "https://www.oreilly.co.jp/books/9784873117836/"}
    end
    assert_response :success

    book = Book.last
    assert_equal book.user, users(:google)
    assert_equal '初めてのJavaScript 第3版――ES2015以降の最新ウェブ開発', book.title
    assert_equal 'https://www.oreilly.co.jp/books/9784873117836/', book.item_url
    assert_equal 'OreillyJp', book.provider
  end

  test 'import from unsupported url' do
    e = assert_raises(ArgumentError) do
      post :create, params: { url: "https://translate.google.com"}
    end
    assert_equal 'Unsupported Domain: https://translate.google.com', e.message
  end

  test 'invalid params' do
    post :create
    assert_response :not_found
  end
end
