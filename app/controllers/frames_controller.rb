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

  private

  def frame_params
    params.require(:frame).permit(:description, :shutter_speed, :aperture, :photo)
  end

end
