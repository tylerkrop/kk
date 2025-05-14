class MeetingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @meetings = Meeting.with_future_meeting_times
  end
end
