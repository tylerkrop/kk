class AddMeetingTimeToMeetings < ActiveRecord::Migration[8.0]
  def change
    add_column :meetings, :meeting_time, :datetime
  end
end
