require 'test_helper'

class PayjpControllerTest < ActionDispatch::IntegrationTest
  test "should get payjp" do
    get payjp_payjp_url
    assert_response :success
  end

  test "should get item" do
    get payjp_item_url
    assert_response :success
  end

end
