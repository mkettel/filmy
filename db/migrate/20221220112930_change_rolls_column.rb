class ChangeRollsColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :rolls, :cameras_id, :camera_id
  end
end
