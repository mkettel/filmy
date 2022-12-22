class RollsController < ApplicationController

  def index
    @user = current_user
    @rolls = Roll.all
    @users_rolls = current_user.rolls
  end
end
