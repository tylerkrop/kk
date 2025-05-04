class Book < ApplicationRecord
  scope :with_visible, -> { where(hidden: false) }
  validates :title, presence: true
  validates :author, presence: true
  validates :url, presence: true, format: { with: /\Ahttps:\/\/app\.thestorygraph\.com\/books\/.*\z/, message: "must link to StoryGraph" }
end
