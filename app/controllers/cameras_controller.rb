class CamerasController < ApplicationController

  # use this method to display all of the cameras.
  def index
    @cameras = Camera.all
    @user = current_user
    @users_cameras = current_user.cameras
    # @camera_id = Camera.id
    @selected_camera = params[:selected_camera] || @users_cameras.first.id

    @rolls_index_page_url = url_for(controller: "rolls", action: "index", camera_id: @selected_camera)
  end

  def show
    @camera = Camera.find(params[:id])
  end

  def new
    @camera = Camera.new
  end

  def create
    @user = current_user
    # @camera = Camera.new(camera_params)
  end
end
