class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :url, presence: true
end
