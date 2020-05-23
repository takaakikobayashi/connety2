require 'test_helper'

class Requesters::ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get requesters_reviews_index_url
    assert_response :success
  end

end
