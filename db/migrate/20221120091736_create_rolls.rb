class CreateRolls < ActiveRecord::Migration[7.0]
  def change
    create_table :rolls do |t|
      t.string :name
      t.string :roll_type
      t.references :cameras, null: false, foreign_key: true

      t.timestamps
    end
  end
end
