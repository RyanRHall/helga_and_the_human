class CreateGeoPoints < ActiveRecord::Migration
  def change
    create_table :geo_points do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.float :lat,   null: false
      t.float :lng,   null: false
      t.timestamps    null: false
    end
  end
end
