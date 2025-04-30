class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :user_id, presence: true
  validates :book_id, presence: true
  acts_as_list top_of_list: 0, scope: :user

  # Borda Count (Bottom-Tie) Ranking Algorithm
  def current_points
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
