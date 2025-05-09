require "test_helper"

class MeetingsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  test "index is public" do
    get :index
    assert_response :success
  end

  test "only shows future meetings" do
    get :index
    assert_response :success
    meetings = assigns(:meetings)
    assert_not_nil meetings
    assert_equal meetings.count, 2
    assert meetings.all? { |meeting| meeting.meeting_time > Time.now }
  end
end
