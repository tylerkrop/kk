class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :user_id, presence: true
  validates :book_id, presence: true
  acts_as_list top_of_list: 0, scope: :user
end
