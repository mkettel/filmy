class PhotosController < ApplicationController

  #This should allow for the settings and details for the photo to be saved to the roll.

  # Could be used to display all of the photos. Almost want to a live form that can be updated as needed
  def index
    @camera = Camera.find(params[:camera_id]) # gets the camera with the id needed
    @user = current_user # sets the current user
  end

  def create
    @user = current_user
    @photo = Photo.new(photo_params)
    @roll = Roll.find(params[:roll_id])
    @camera = Camera.find(params[:camera_id])
    params[:frames] do |frame_params|
      @roll.frames.create(
        photo: frame_params[:photo],
        shutter_speed: frame_params[:shutter_speed],
        aperture: frame_params[:aperture],
        description: frame_params[:description]
      )
    end
    if @photo.save
      raise
    end
    # if params[:frame_number].present?
    #   @frame_number = params[:frame_number]
    #   @shutter_speed = params[:shutter_speed]
    #   @aperture = params[:aperture]
    #   @description = params[:description]
    #   @photo = @roll.photos.build(photo_params)
    #   if @photo.save
    #     raise
    #   end
    # end
  end


  private

  def photo_params
    params.require(:photo).permit(:frame_number, :shutter_speed, :aperture, :description)
  end

end
