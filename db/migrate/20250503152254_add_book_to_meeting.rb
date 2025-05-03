class AddBookToMeeting < ActiveRecord::Migration[8.0]
  def change
    add_reference :meetings, :book, foreign_key: true
    Meeting.reset_column_information
    Meeting.find_each do |meeting|
      meeting.update(book_id: meeting.meeting_series.book_id)
    end
    change_column_null :meetings, :book_id, false
    remove_reference :meetings, :meeting_series
    drop_table :meeting_series
  end
end
