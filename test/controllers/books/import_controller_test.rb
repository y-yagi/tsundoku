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

  test 'import from Amazon JP' do
    assert_difference('Book.count') do
      VCR.use_cassette('OreillyJpController') do
        post :create, params: { url: "https://www.amazon.co.jp/gp/product/B01N4AT0ZD/"}
      end
    end
    assert_response :success

    book = Book.last
    assert_equal book.user, users(:google)
    assert_equal '大事なことに集中する', book.title
    assert_equal 'https://www.amazon.co.jp/gp/product/B01N4AT0ZD/', book.item_url
    assert_equal 'AmazonJp', book.provider
  end

  test 'import from pragprog' do
    assert_difference('Book.count') do
      VCR.use_cassette('PragprogController') do
        post :create, params: { url: "https://pragprog.com/book/fugue/scalable-cloud-ops-with-fugue"}
      end
    end
    assert_response :success

    book = Book.last
    assert_equal book.user, users(:google)
    assert_equal 'Scalable Cloud Ops with Fugue: Declare, Deploy, and Automate the Cloud', book.title
    assert_equal 'https://pragprog.com/book/fugue/scalable-cloud-ops-with-fugue', book.item_url
    assert_equal 'Pragprog', book.provider
  end

  test 'import from Gihyo Digital Publishing' do
    assert_difference('Book.count') do
      VCR.use_cassette('GihyoDigitalPublishingController') do
        post :create, params: { url: "https://gihyo.jp/dp/ebook/2016/978-4-7741-8634-4"}
      end
    end
    assert_response :success

    book = Book.last
    assert_equal book.user, users(:google)
    assert_equal '人工知能の作り方―「おもしろい」ゲームAIはいかにして動くのか', book.title
    assert_equal 'https://gihyo.jp/dp/ebook/2016/978-4-7741-8634-4', book.item_url
    assert_equal 'GihyoDigitalPublishing', book.provider
  end

  test 'import from Packt' do
    assert_difference('Book.count') do
      VCR.use_cassette('PacktController') do
        post :create, params: { url: "https://www.packtpub.com/big-data-and-business-intelligence/postgresql-high-performance-cookbook"}
      end
    end
    assert_response :success

    book = Book.last
    assert_equal book.user, users(:google)
    assert_equal 'PostgreSQL High Performance Cookbook', book.title
    assert_equal 'https://www.packtpub.com/big-data-and-business-intelligence/postgresql-high-performance-cookbook', book.item_url
    assert_equal 'Packt', book.provider
  end

  test 'import from LambdaNote' do
    assert_difference('Book.count') do
      VCR.use_cassette('LambdaNoteController') do
        post :create, params: { url: "https://www.lambdanote.com/collections/frontpage/products/ruby-ruby"}
      end
    end
    assert_response :success

    book = Book.last
    assert_equal book.user, users(:google)
    assert_equal 'RubyでつくるRuby ゼロから学びなおすプログラミング言語入門（紙書籍）', book.title
    assert_equal 'https://www.lambdanote.com/collections/frontpage/products/ruby-ruby', book.item_url
    assert_equal 'LambdaNote', book.provider
  end

  test 'import from Booth' do
    assert_difference('Book.count') do
      VCR.use_cassette('BoothController') do
        post :create, params: { url: "https://tk-rabbit-house.booth.pm/items/489874" }
      end
    end
    assert_response :success

    book = Book.last
    assert_equal book.user, users(:google)
    assert_equal 'Modern JavaScript', book.title
    assert_equal 'https://tk-rabbit-house.booth.pm/items/489874', book.item_url
    assert_equal 'Booth', book.provider
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
