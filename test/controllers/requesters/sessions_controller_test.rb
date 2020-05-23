require 'test_helper'

class Requesters::SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get requesters_sessions_new_url
    assert_response :success
  end

  test "should get create" do
    get requesters_sessions_create_url
    assert_response :success
  end

  test "should get destroy" do
    get requesters_sessions_destroy_url
    assert_response :success
  end

end
