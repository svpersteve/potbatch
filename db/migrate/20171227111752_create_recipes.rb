class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.text :description
      t.text :ingredients, null: false
      t.text :preparation
      t.text :directions, null: false
      t.string :image_url, null: false
      t.string :prep_time, null: false
      t.string :cooking_time, null: false
      t.integer :serves, null: false
      t.string :slug
      t.timestamps null: false
    end
  end
end
