class AddMeetingSeriesToMeetings < ActiveRecord::Migration[8.0]
  def change
    add_reference :meetings, :meeting_series, null: false, foreign_key: true
  end
end
