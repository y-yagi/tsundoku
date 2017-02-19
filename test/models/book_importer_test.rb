require 'test_helper'

class BookImporterTest < ActiveSupport::TestCase
  test 'import book from unsupported domain' do
    e = assert_raises(ArgumentError) do
      BookImporter.import(url: "https://translate.google.com", user: users(:google))
    end
    assert_equal 'Unsupported Domain: https://translate.google.com', e.message
  end
end
