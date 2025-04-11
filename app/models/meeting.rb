class Meeting < ApplicationRecord
  belongs_to :meeting_series
  validates :meeting_time, presence: true
  validates :reading_expectations, presence: true
end
