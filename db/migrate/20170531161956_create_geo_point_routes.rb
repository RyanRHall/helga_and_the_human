class CreateGeoPointRoutes < ActiveRecord::Migration
  def change
    create_table :geo_point_routes do |t|
      t.belongs_to :route, null: false
      t.belongs_to :geo_point, null: false
      t.integer :position, null: false

      t.timestamps null: false
    end
  end
end
