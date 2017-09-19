class CreatePhotoGroupPhotos < ActiveRecord::Migration
  def change
    create_table :photo_group_photos do |t|
      t.integer :photo_group_id
      t.integer :photo_id

      t.timestamps null: false
    end
  end
end
