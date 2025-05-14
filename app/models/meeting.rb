class Meeting < ApplicationRecord
  belongs_to :book
  scope :with_future_meeting_times, -> { where(arel_table[:meeting_time].gt(Time.current)).order(:meeting_time) }
  validates :meeting_time, presence: true
  validates :reading_expectations, presence: true
end
