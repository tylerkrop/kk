class VotesController < ApplicationController
  before_action :authenticate_user!

  def index
    @votes = Vote.where(user: current_user).order(:position)
  end

  def new
    @vote = Vote.new
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
