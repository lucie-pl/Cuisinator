class ChangeDataTypeForQuantities < ActiveRecord::Migration[7.1]
  def change
    change_column(:quantities, :quantity, :integer)
  end
end
