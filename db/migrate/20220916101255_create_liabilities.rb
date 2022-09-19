class CreateLiabilities < ActiveRecord::Migration[7.0]
  def change
    create_table :liabilities do |t|
      t.string :name
      t.decimal :amount
      t.integer :user_id
      t.integer :expense_id
      t.integer :liable_to

      t.timestamps
    end
  end
end
