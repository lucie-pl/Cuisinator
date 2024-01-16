class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :description
      t.string :instruction
      t.string :image

      t.timestamps
    end
  end
end
