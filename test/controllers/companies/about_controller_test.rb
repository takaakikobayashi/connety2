require 'test_helper'

class Companies::AboutControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get companies_about_show_url
    assert_response :success
  end

end
