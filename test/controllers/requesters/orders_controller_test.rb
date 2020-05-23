require 'test_helper'

class Requesters::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get requesters_orders_new_url
    assert_response :success
  end

  test "should get create" do
    get requesters_orders_create_url
    assert_response :success
  end

  test "should get index" do
    get requesters_orders_index_url
    assert_response :success
  end

  test "should get destroy" do
    get requesters_orders_destroy_url
    assert_response :success
  end

end
