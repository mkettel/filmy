class CamerasController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:destroy]

  # use this method to display all of the cameras.
  def index
    @cameras = Camera.all
    @user = current_user
    @users_cameras = current_user.cameras
    # @camera_id = Camera.id
    if @users_cameras.empty?
      flash.now[:notice] = "You have no cameras yet."
    else
      @selected_camera = params[:selected_camera] || @users_cameras.first.id
      @rolls_index_page_url = url_for(controller: "rolls", action: "index", camera_id: @selected_camera)
    end
    # @selected_camera = params[:selected_camera] || @users_cameras.first.id
  end

  def show
    @camera = Camera.find(params[:id])
  end

  def new
    @camera = Camera.new
  end

  def create
    @user = current_user
    @camera = Camera.new(camera_params)
    @camera.user = current_user
    if @camera.save
      redirect_to cameras_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # @camera = Camera.find(params[:id])
    @camera = Camera.find(params[:camera_id])
    @camera.destroy
    flash[:notice] = "Your camera listing was successfully deleted"
    redirect_to cameras_path
  end


  private

  def camera_params
    params.require(:camera).permit(:model, :year)
  end
end
