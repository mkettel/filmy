class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.integer :roll_id
      t.integer :frame_number
      t.string :shutter_speed
      t.string :aperture
      t.string :description

      t.timestamps
    end
  end
end
