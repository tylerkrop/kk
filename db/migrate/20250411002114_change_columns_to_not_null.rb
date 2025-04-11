class ChangeColumnsToNotNull < ActiveRecord::Migration[8.0]
  def change
    change_column_null :books, :title, false
    change_column_null :books, :author, false
    change_column_null :meetings, :meeting_time, false
    change_column_null :meetings, :reading_expectations, false
    change_column_null :users, :provider, false
    change_column_null :users, :uid, false
    change_column_null :users, :username, false
  end
end
