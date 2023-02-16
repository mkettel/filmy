class PhotosController < ApplicationController

  #This should allow for the settings and details for the photo to be saved to the roll.
  def create
    @roll = Roll.find(params[:roll_id])
    @frame_number = params[:frame_number]
    @shutter_speed = params[:shutter_speed]
    @aperture = params[:aperture]
    @description = params[:description]
    @photo = roll.photos.build(:frame_number, :shutter_speed, :aperture, :description)
    if @photo.save
      raise
    end
  end


  private

  def photo_params
    params.require(:photos).permit(:frame_number, :shutter_speed, :aperture, :description)
  end

end
