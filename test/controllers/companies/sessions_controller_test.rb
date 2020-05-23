require 'test_helper'

class Companies::SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get companies_sessions_new_url
    assert_response :success
  end

  test "should get create" do
    get companies_sessions_create_url
    assert_response :success
  end

  test "should get destroy" do
    get companies_sessions_destroy_url
    assert_response :success
  end

end
