class MeetingsController < ApplicationController
  def index
    @meetings = Meeting.where("meeting_time > ?", Time.now).order(:meeting_time)
  end
end
