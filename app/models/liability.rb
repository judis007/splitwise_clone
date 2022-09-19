class Liability < ApplicationRecord
  belongs_to :expense
  belongs_to :user

  enum name: { debit: 'debit', credit: 'credit' }

  validates_presence_of :name, :user_id, :expense_id, :amount
end