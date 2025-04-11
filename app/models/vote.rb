class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :rank, presence: true
  validates :user_id, presence: true
  validates :book_id, presence: true
end
