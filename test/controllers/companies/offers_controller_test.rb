require 'test_helper'

class Companies::OffersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get companies_offers_index_url
    assert_response :success
  end

  test "should get new" do
    get companies_offers_new_url
    assert_response :success
  end

  test "should get create" do
    get companies_offers_create_url
    assert_response :success
  end

  test "should get show" do
    get companies_offers_show_url
    assert_response :success
  end

  test "should get edit" do
    get companies_offers_edit_url
    assert_response :success
  end

  test "should get update" do
    get companies_offers_update_url
    assert_response :success
  end

end
