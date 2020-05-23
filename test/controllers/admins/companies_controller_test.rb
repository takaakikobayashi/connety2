require 'test_helper'

class Admins::CompaniesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_companies_index_url
    assert_response :success
  end

end
