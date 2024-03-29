require "test_helper"

class OutcomesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @outcome = outcomes(:one)
  end

  test "should get index" do
    get outcomes_url
    assert_response :success
  end

  test "should get new" do
    get new_outcome_url
    assert_response :success
  end

  test "should create outcome" do
    assert_difference("Outcome.count") do
      post outcomes_url, params: { outcome: { lis_result_sourcedid: @outcome.lis_result_sourcedid, passing_threshold: @outcome.passing_threshold, score: @outcome.score } }
    end

    assert_redirected_to outcome_url(Outcome.last)
  end

  test "should show outcome" do
    get outcome_url(@outcome)
    assert_response :success
  end

  test "should get edit" do
    get edit_outcome_url(@outcome)
    assert_response :success
  end

  test "should update outcome" do
    patch outcome_url(@outcome), params: { outcome: { lis_result_sourcedid: @outcome.lis_result_sourcedid, passing_threshold: @outcome.passing_threshold, score: @outcome.score } }
    assert_redirected_to outcome_url(@outcome)
  end

  test "should destroy outcome" do
    assert_difference("Outcome.count", -1) do
      delete outcome_url(@outcome)
    end

    assert_redirected_to outcomes_url
  end
end
