class CreateDescriptions < ActiveRecord::Migration
  def change
    create_table :descriptions do |t|
      t.string :slug, null: false
      t.string :title, null: false
      t.text :content
      t.timestamps null: false
    end
  end
end
