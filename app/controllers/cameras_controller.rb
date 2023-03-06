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

  def edit
    @camera = current_user.cameras.find_by_id(params[:id])
  end

  def update
    @camera = current_user.cameras.find_by_id(params[:id])
    if @camera.update(camera_params)
      flash[:notice] = "your camera was updated"
    end
    redirect_to cameras_path
  end

  def destroy
    @camera = current_user.cameras.find_by_id(params[:id]) #it is important to be specific to the current user
    if @camera
      flash[:notice] = "Are you sure you want to delete this Camera?"
      if @camera.destroy
        flash[:notice] = "Your camera listing was successfully deleted"
      else
        flash[:notice] = "Failed to delete your camera"
      end
    end
    redirect_to cameras_path
  end


  private

  def camera_params
    params.require(:camera).permit(:model, :year)
  end
end
