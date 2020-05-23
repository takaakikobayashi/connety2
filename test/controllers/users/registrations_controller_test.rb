require 'test_helper'

class Users::RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_registrations_new_url
    assert_response :success
  end

  test "should get create" do
    get users_registrations_create_url
    assert_response :success
  end

  test "should get edit" do
    get users_registrations_edit_url
    assert_response :success
  end

  test "should get update" do
    get users_registrations_update_url
    assert_response :success
  end

end
