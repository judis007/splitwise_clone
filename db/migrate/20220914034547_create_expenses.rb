class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.string :category
      t.decimal :expense
      t.integer :liability_id
      t.integer :group_id

      t.timestamps
    end
  end
end
