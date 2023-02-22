class CreateFrames < ActiveRecord::Migration[7.0]
  def change
    create_table :frames do |t|
      t.text :description
      t.float :aperture
      t.float :shutter_speed
      t.references :roll, null: false, foreign_key: true

      t.timestamps
    end
  end
end
