require "test_helper"

class OutcomeEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get outcome_events_index_url
    assert_response :success
  end
end
