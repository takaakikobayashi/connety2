require 'test_helper'

class Requesters::ProblemSolutionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get requesters_problem_solutions_index_url
    assert_response :success
  end

end
