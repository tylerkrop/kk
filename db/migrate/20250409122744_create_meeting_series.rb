class CreateMeetingSeries < ActiveRecord::Migration[8.0]
  def change
    create_table :meeting_series do |t|
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
