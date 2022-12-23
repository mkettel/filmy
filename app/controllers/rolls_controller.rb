class RollsController < ApplicationController

  def index
    # @camera = Camera.find(params[:id])
    @user = current_user
    @rolls = Roll.all
    @users_rolls = current_user.rolls
  end
end
