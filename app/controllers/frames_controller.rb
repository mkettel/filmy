class FramesController < ApplicationController

  def new
    @roll = Roll.find(params[:roll_id])
    @camera = Camera.find(params[:camera_id])
    @frame = Frame.new
    @roll_id = @roll.id
  end

  def create
    @roll = Roll.find(params[:roll_id])  # finds the roll that the frame is being created for
    @frame = @roll.frames.build(frame_params) # creates a new frame for the roll
    @camera = Camera.find(params[:camera_id]) # finds the camera that the roll is associated with
    @roll_id = @roll.id # sets the roll id to the roll id
    if @frame.save
      redirect_to camera_rolls_path(@camera, @roll)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @camera = Camera.find(params[:camera_id]) # finds the camera that the roll is associated with
    @roll = Roll.find(params[:roll_id]) # finds the roll that the frame is being created for
    @frame = Frame.find(params[:id]) # finds the frame that is being edited
  end

  def update
    @camera = Camera.find(params[:camera_id]) # finds the camera that the roll is associated with
    @roll = Roll.find(params[:roll_id]) # finds the roll that the frame is being created for
    @frame = Frame.find(params[:id]) # finds the frame that is being edited

    if @frame.update(frame_params)
      flash[:notice] = "Your frame was updated."

      # Check which fields were changed
      if @frame.description_changed?
        # Do something if the description field was changed
        @frame.update_attribute(:description, frame_params[:description])
      end

      if @frame.shutter_speed_changed?
        # Do something if the shutter_speed field was changed
        @frame.update_attribute(:shutter_speed, frame_params[:shutter_speed])
      end

      if @frame.aperture_changed?
        # Do something if the aperture field was changed
        @frame.update_attribute(:aperture, frame_params[:aperture])
      end

      if @frame.photo_changed?
        # Do something if the photo field was changed
        @frame.update_attribute(:photo, frame_params[:photo])
      end

      redirect_to frameshit_path(@frame) # redirect to the frame show page
    end
  end

  private

  def frame_params
    params.require(:frame).permit(:description, :shutter_speed, :aperture, :photo)
  end

end
