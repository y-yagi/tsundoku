require 'test_helper'

class BookTest < ActiveSupport::TestCase
  sub_test_case('validation') do
    test 'should have the necessary required validators' do
      book = Book.new(user: users(:google))
      assert_not book.valid?
      assert_equal %i(title item_url provider), book.errors.keys
    end
  end
end
