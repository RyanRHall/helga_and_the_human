class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.date :date, null: false
      t.string :title, null: false

      t.timestamps null: false
    end
  end
end
