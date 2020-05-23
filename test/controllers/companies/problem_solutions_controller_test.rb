require 'test_helper'

class Companies::ProblemSolutionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get companies_problem_solutions_index_url
    assert_response :success
  end

end
