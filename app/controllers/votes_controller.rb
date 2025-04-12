class VotesController < ApplicationController
  before_action :authenticate_user!

  def index
    @votes = Vote.where(user: current_user).order(:position)
  end

  def destroy
    @vote = current_user.votes.find(params[:id])
    if @vote.destroy
      redirect_to votes_path, notice: "Vote was successfully deleted"
    else
      redirect_to votes_path, alert: "Error: #{@vote.errors.full_messages.join(", ")}"
    end
  end
end
