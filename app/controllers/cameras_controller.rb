class CamerasController < ApplicationController

  # use this method to display all of the cameras.
  def index
    @cameras = Camera.all
    @user = current_user
    @users_cameras = current_user.cameras

  end

  def show
    @camera = Camera.find(params[:id])

  end
end
