require 'test_helper'

class Companies::RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get companies_registrations_new_url
    assert_response :success
  end

  test "should get create" do
    get companies_registrations_create_url
    assert_response :success
  end

  test "should get edit" do
    get companies_registrations_edit_url
    assert_response :success
  end

  test "should get update" do
    get companies_registrations_update_url
    assert_response :success
  end

end
