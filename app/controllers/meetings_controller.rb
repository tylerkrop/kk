class MeetingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @meetings = Meeting.with_future_meeting_times
  end

  def new
    @meeting = Meeting.new(meeting_time: Time.current.change(hour: 20, min: 0))
    @books = Book.where(hidden: true).order(:updated_at)
  end

  def create
    render json: { error: "You must be logged in to create a meeting" }, status: :unauthorized unless user_signed_in? && current_user.admin?

    @meeting = Meeting.new(meeting_params)
    if @meeting.save
      redirect_to new_meeting_path(@meeting), notice: "Meeting was successfully created"
    else
      redirect_to new_meeting_path, alert: "Error: #{@meeting.errors.full_messages.join(", ")}"
    end
  end

  private

  def meeting_params
    params.require(:meeting).permit(:book_id, :meeting_time, :reading_expectations)
  end
end
