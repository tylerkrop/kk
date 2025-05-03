class Meeting < ApplicationRecord
  belongs_to :book
  validates :meeting_time, presence: true
  validates :reading_expectations, presence: true
end
