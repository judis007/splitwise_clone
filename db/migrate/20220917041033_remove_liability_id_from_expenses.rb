class RemoveLiabilityIdFromExpenses < ActiveRecord::Migration[7.0]
  def change
    remove_column :expenses, :liability_id
  end
end
