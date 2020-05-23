require 'test_helper'

class Requesters::AboutControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get requesters_about_show_url
    assert_response :success
  end

end
