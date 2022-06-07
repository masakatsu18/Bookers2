require "test_helper"

class Books　newControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get books　new_index_url
    assert_response :success
  end

  test "should get show" do
    get books　new_show_url
    assert_response :success
  end
end
