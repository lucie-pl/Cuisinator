# frozen_string_literal: true

class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.string :image, null: false

      t.timestamps
    end
  end
end
