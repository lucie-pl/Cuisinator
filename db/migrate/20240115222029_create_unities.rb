class CreateUnities < ActiveRecord::Migration[7.1]
  def change
    create_table :unities do |t|
      t.string :unity

      t.timestamps
    end
  end
end
