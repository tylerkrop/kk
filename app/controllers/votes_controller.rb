class VotesController < ApplicationController
  before_action :authenticate_user!

  def index
    @votes = Vote.where(user: current_user).order(:position)
  end

  def create
    @vote = Vote.new(user: current_user, book_id: params[:book_id])
    if @vote.save
      redirect_back(fallback_location: books_path, notice: "Vote was successfully created")
    else
      redirect_back(fallback_location: books_path, alert: "Error: #{@vote.errors.full_messages.join(", ")}")
    end
  end

  def destroy
    @vote = current_user.votes.find(params[:id])
    if @vote.destroy
      redirect_to votes_path
    else
      raise "Failed to destroy vote: #{@vote.errors.full_messages.join(", ")}"
    end
  end
end
