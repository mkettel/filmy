class RollsController < ApplicationController

  def index
    @camera = Camera.find(params[:camera_id]) # gets the camera with the id needed
    @cameras_rolls = @camera.rolls # gets the rolls for that specific camera
    @user = current_user
    @rolls = Roll.all
    @users_rolls = current_user.rolls  # this would be all of the cameras rolls
  end
end
