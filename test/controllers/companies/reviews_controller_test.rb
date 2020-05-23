require 'test_helper'

class Companies::ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get companies_reviews_index_url
    assert_response :success
  end

end
