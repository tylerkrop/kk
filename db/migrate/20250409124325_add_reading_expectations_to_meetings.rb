class AddReadingExpectationsToMeetings < ActiveRecord::Migration[8.0]
  def change
    add_column :meetings, :reading_expectations, :string
  end
end
