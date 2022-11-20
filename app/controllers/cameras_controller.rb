class CamerasController < ApplicationController

  def index
    @cameras = Camera.all
  end

end
