class ChangeDataTypeForQuantitiesFloat < ActiveRecord::Migration[7.1]
  def change
    change_column(:quantities, :quantity, :float)
  end
end
