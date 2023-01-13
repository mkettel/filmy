class AddDrawingToCameras < ActiveRecord::Migration[7.0]
  def change
    add_column :cameras, :drawing, :string
  end
end
