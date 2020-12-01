class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :source
      t.string :recipe_url
      t.string :servings
      t.integer :total_prep_time
      t.text :intro
      t.text :ingredients
      t.text :instructions
      t.text :notes
      t.string :image_url

      t.timestamps
    end
  end
end
