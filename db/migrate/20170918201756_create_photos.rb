class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :filename, null: false
      t.string :caption, null: false

      t.timestamps null: false
    end
  end
end
