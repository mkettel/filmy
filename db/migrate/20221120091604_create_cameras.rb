class CreateCameras < ActiveRecord::Migration[7.0]
  def change
    create_table :cameras do |t|
      t.string :model
      t.integer :year
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
