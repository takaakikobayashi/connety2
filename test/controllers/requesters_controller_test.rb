require 'test_helper'

class RequestersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get requesters_show_url
    assert_response :success
  end

  test "should get edit" do
    get requesters_edit_url
    assert_response :success
  end

  test "should get update" do
    get requesters_update_url
    assert_response :success
  end

end
