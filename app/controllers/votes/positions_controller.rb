class Votes::PositionsController < ApplicationController
  before_action :authenticate_user!

  def update
    @vote = current_user.votes.find(params[:vote_id])

    @vote.insert_at(params[:position])

    head :no_content
  end
end
