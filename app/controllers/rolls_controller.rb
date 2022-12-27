class RollsController < ApplicationController

  def index
    @camera = Camera.find(params[:camera_id]) # gets the camera with the id needed
    @cameras_rolls = @camera.rolls # gets the rolls for that specific camera
    @user = current_user
    @rolls = Roll.all
    @users_rolls = current_user.rolls  # this would be all of the cameras rolls
  end

  def new
    @roll = Roll.new
  end

  def create
    @camera = Camera.find(params[:camera_id]) #gets the camera with the id needed
    @user = current_user  # sets the current user
    @roll = Roll.new(roll_params) # creates a new roll with the proper parameters hidded
    # @roll.user = current_user
    @roll.camera = Camera.find(params[:camera_id])
    if @roll.save
      redirect_to camera_rolls_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def roll_params
    params.require(:roll).permit(:name, :roll_type)
  end

end
