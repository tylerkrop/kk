class MeetingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @meetings = Meeting.where("meeting_time > ?", Time.now).order(:meeting_time)
  end
end
