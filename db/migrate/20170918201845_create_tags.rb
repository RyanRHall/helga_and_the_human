class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :photo_id
      t.string :slug

      t.timestamps null: false
    end
  end
end
