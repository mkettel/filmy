class ChangeApertureAndShutterSpeedToStringInFrames < ActiveRecord::Migration[7.0]
  def change
    change_column :frames, :aperture, :string
    change_column :frames, :shutter_speed, :string
  end
end
