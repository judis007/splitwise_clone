# frozen_string_literal: true

class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.string :category
      t.string :name
      t.decimal :expense
      t.string :currency
      t.integer :group_id

      t.timestamps
    end
  end
end
