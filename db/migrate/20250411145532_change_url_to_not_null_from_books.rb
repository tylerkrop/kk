class ChangeUrlToNotNullFromBooks < ActiveRecord::Migration[8.0]
  def change
    change_column_null :books, :url, false
  end
end
