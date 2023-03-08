class FramesController < ApplicationController

  def new
    @roll = Roll.find(params[:roll_id])
    @camera = Camera.find(params[:camera_id])
    @frame = Frame.new
    @roll_id = @roll.id
  end

  def create
    @roll = Roll.find(params[:roll_id])
    @frame = @roll.frames.build(frame_params)
    @camera = Camera.find(params[:camera_id])
    @roll_id = @roll.id
    if @frame.save
      redirect_to camera_rolls_path(@camera, @roll)
    end
  end

  def edit
    @camera = Camera.find(params[:camera_id])
    @roll = Roll.find(params[:roll_id])
    @frame = Frame.find(params[:id])
  end

  def update
    # @camera = current_user.cameras.find_by_id(params[:id])
    # @camera = Camera.find(params[:camera_id])
    # @roll = current_user.cameras.rolls.find_by_id(params[:roll_id])
    @frame = Frame.find(params[:id])
    if @frame.update(frame_params)
      flash[:notice] = "your frame was updated"
    end
    # redirect_to frameshit_path(@frame)

  end

  private

  def frame_params
    params.require(:frame).permit(:description, :shutter_speed, :aperture, :photo)
  end

end
