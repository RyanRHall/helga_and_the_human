class CreatePhotoGroups < ActiveRecord::Migration
  def change
    create_table :photo_groups do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
