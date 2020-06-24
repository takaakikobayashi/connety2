require 'test_helper'

class Admins::NewsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admins_news_new_url
    assert_response :success
  end

  test "should get create" do
    get admins_news_create_url
    assert_response :success
  end

end
