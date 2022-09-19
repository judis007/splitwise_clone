# frozen_string_literal: true

class Expense < ApplicationRecord
  belongs_to :group
  has_many :liabilities, dependent: :destroy

  validates_presence_of :category, :expense, :group_id, :name, :currency
end
