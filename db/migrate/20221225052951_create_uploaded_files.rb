class CreateUploadedFiles < ActiveRecord::Migration[7.0]
  def change
    create_table :uploaded_files do |t|
      t.references :roll, null: false, foreign_key: true
      t.string :filename
      t.string :content_type
      t.integer :size
      t.string :file

      t.timestamps
    end
  end
end
