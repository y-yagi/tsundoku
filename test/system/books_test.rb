require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup { login }

  test "visiting the index" do
    visit books_path

    assert_match "ゼロから作るDeep Learnin", page.text
  end
end
