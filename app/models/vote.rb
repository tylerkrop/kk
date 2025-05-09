class Vote < ApplicationRecord
  acts_as_list top_of_list: 0, scope: :user
  belongs_to :user
  belongs_to :book
  scope :with_position, -> { where.not(position: nil) }
  validates :user_id, presence: true
  validates :book_id, presence: true

  # Borda Count (Bottom-Tie) Ranking Algorithm
  def self.current_points
    titles = Vote.all.map do |vote|
      vote.book.title
    end.uniq
    k = titles.size
    points = Hash.new(0)
    Vote.all.each do |vote|
      points[vote.book.title] += k - vote.position
    end
    points.sort_by { |k, v|-v }.each do |k, v|
      puts "#{k}: #{v}"
    end
  end
end
