class Liability < ApplicationRecord
  belongs_to :expense
  belongs_to :user

  enum name: { debit: 'debit', credit: 'credit' }
end