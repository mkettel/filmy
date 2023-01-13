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

  def show
    @camera = Camera.find(params[:camera_id]) # should find the correct camera
    @user = current_user # assigns the current user
    @roll = Roll.find(params[:id])
    @roll.camera_id = Camera.find(params[:camera_id]) # should find the roll that is clikced on (used for ajax request)
    respond_to do |format|
      format.html
      format.js
    end
    render partial: 'roll'
  end

  def upload_image
    frame_id = params[:frame_id]
    # Save the uploaded image to a database or file storage service

  end

  private

  def roll_params
    params.require(:roll).permit(:name, :roll_type)
  end

end

# Psuedocode for how to add data to a roll
# I added the uploaded files class to the schema so i will be able to use that to get access to the proper files and data needed for the rolls
# I left off at a point where i have a frame_id that i think i need to add to the class of the roll perhaps? i need chatgpt to help lol
