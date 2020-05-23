require 'test_helper'

class Requesters::StrengthsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get requesters_strengths_index_url
    assert_response :success
  end

  test "should get show" do
    get requesters_strengths_show_url
    assert_response :success
  end

end
