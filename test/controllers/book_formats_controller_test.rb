require 'test_helper'

class BookFormatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get book_formats_index_url
    assert_response :success
  end

  test "should get show" do
    get book_formats_show_url
    assert_response :success
  end

end
