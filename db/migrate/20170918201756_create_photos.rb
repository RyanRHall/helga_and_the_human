class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :img_path, null: false
      t.string :thumbnail_path, null: false
      t.string :caption

      t.timestamps null: false
    end
  end
end
