require 'test_helper'

class RoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rooms_index_url
    assert_response :success
  end

  test "should get new" do
    get rooms_new_url
    assert_response :success
  end

  test "should get show" do
    get rooms_show_url
    assert_response :success
  end

end
