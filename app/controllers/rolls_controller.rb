class RollsController < ApplicationController

  def index
    @camera = Camera.find(params[:camera_id]) # gets the camera with the id needed
    @cameras_rolls = @camera.rolls # gets the rolls for that specific camera
    @user = current_user
    @rolls = Roll.all
    # @roll = Roll.find(params[:id])
    @users_rolls = current_user.rolls  # this would be all of the cameras rolls
    # @photos = Photo.all
  end

  def new
    @roll = Roll.new
    @camera = Camera.find(params[:camera_id])
  end

  def create
    @camera = Camera.find(params[:camera_id]) #gets the camera with the id needed
    @user = current_user # sets the current user
    @roll = Roll.new(roll_params) # creates a new roll with the proper parameters needed
    # @roll.user = current_user
    @roll.camera = Camera.find(params[:camera_id])
    if @roll.save
      redirect_to camera_rolls_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @camera = Camera.find(params[:camera_id])
    @roll = Roll.find(params[:id])
  end

  def update
    @camera = current_user.cameras.find_by_id(params[:id])
    @roll = Roll.find(params[:id])
    if @roll.update(roll_params)
      flash[:notice] = "your film roll was updated"
    end
    redirect_to camera_rolls_path
  end

  def destroy
    @camera = current_user.cameras.find_by_id(params[:id]) #it is important to be specific to the current user
    @roll = Roll.find(params[:id])
    if @roll
      flash[:notice] = "Are you sure you want to delete this Roll?"
      if @roll.destroy
        flash[:notice] = "Your camera listing was successfully deleted"
      else
        flash[:notice] = "Failed to delete your camera"
      end
    end
    redirect_to camera_rolls_path
  end

  def show
    @camera = Camera.find(params[:camera_id]) # should find the correct camera
    @user = current_user # assigns the current user
    @roll = Roll.find(params[:id])
    @roll.camera_id = Camera.find(params[:camera_id]) # should find the roll that is clikced on (used for ajax request)
    # @frames = @roll.frames
    @frames = @roll.frames.order(:created_at)
    respond_to do |format|
      format.html
      format.js
    end
    render partial: 'roll'
  end

  def create_frame
    @roll = Roll.find(params[:roll_id])
    @frame = @roll.frames.build(frame_params)

    respond_to do |format|
      if @frame.save
        format.html { redirect_to @roll, notice: 'Frame was successfully created.' }
        format.json { render :show, status: :created, location: @roll }
      else
        format.html { render :show }
        format.json { render json: @frame.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def roll_params
    params.require(:roll).permit(:name, :roll_type)
  end

  def frame_params
    params.require(:frame).permit(:description, :aperture, :shutter_speed, :photo)
  end
end
