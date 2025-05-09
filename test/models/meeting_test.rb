require "test_helper"

class MeetingTest < ActiveSupport::TestCase
  test "valid meeting" do
    meeting = Meeting.new(
      book: books(:one),
      meeting_time: Time.now + 1.day,
      reading_expectations: "Read chapters 1-3"
    )
    assert meeting.valid?
  end

  test "invalid without book" do
    meeting = Meeting.new(
      meeting_time: Time.now + 1.day,
      reading_expectations: "Read chapters 1-3"
    )
    assert_not meeting.valid?
    assert_includes meeting.errors[:book], "must exist"
  end

  test "invalid without meeting_time" do
    meeting = Meeting.new(
      book: books(:one),
      reading_expectations: "Read chapters 1-3"
    )
    assert_not meeting.valid?
    assert_includes meeting.errors[:meeting_time], "can't be blank"
  end

  test "invalid without reading_expectations" do
    meeting = Meeting.new(
      book: books(:one),
      meeting_time: Time.now + 1.day
    )
    assert_not meeting.valid?
    assert_includes meeting.errors[:reading_expectations], "can't be blank"
  end
end
