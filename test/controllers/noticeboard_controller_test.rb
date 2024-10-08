require "test_helper"

class NoticeboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get noticeboard_index_url
    assert_response :success
  end

  test "should get new" do
    get noticeboard_new_url
    assert_response :success
  end

  test "should get create" do
    get noticeboard_create_url
    assert_response :success
  end

  test "should get show" do
    get noticeboard_show_url
    assert_response :success
  end
end
