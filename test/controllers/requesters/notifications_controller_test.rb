require 'test_helper'

class Requesters::NotificationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get requesters_notifications_index_url
    assert_response :success
  end

end
