class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.belongs_to :photo, null: false
      t.string :slug, null: false
      t.integer :priority

      t.timestamps null: false
    end
  end
end
