class RemoveTitleFromMeetings < ActiveRecord::Migration[8.0]
  def change
    remove_column :meetings, :title, :string
  end
end
