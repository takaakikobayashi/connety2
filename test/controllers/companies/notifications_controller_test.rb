require 'test_helper'

class Companies::NotificationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get companies_notifications_index_url
    assert_response :success
  end

end
