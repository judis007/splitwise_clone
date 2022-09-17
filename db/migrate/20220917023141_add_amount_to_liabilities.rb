class AddAmountToLiabilities < ActiveRecord::Migration[7.0]
  def change
    add_column :liabilities, :amount, :decimal
  end
end
