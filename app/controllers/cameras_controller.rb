class CamerasController < ApplicationController

  def index
    @cameras = Camera.all
    @user = current_user
    @users_cameras = current_user.cameras
  end

end
