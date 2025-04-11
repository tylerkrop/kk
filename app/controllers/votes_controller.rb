class VotesController < ApplicationController
  before_action :authenticate_user!

  def index
    @votes = Vote.where(user: current_user).order(:position)
  end
end
