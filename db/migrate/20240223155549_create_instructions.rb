# frozen_string_literal: true

class CreateInstructions < ActiveRecord::Migration[7.1]
  def change
    create_table :instructions do |t|
      t.integer :step
      t.string :instruction
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
