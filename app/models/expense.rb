class Expense < ApplicationRecord
  belongs_to :group
  has_many :liabilities, dependent: :destroy
end