require 'test_helper'

class Companies::StrengthsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get companies_strengths_index_url
    assert_response :success
  end

  test "should get show" do
    get companies_strengths_show_url
    assert_response :success
  end

end
