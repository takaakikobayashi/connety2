require 'test_helper'

class Requesters::RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get requesters_registrations_new_url
    assert_response :success
  end

  test "should get create" do
    get requesters_registrations_create_url
    assert_response :success
  end

  test "should get edit" do
    get requesters_registrations_edit_url
    assert_response :success
  end

  test "should get update" do
    get requesters_registrations_update_url
    assert_response :success
  end

end
