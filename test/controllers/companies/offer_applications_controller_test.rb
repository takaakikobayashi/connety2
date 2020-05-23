require 'test_helper'

class Companies::OfferApplicationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get companies_offer_applications_create_url
    assert_response :success
  end

  test "should get destroy" do
    get companies_offer_applications_destroy_url
    assert_response :success
  end

end
