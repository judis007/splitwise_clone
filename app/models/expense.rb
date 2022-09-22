# frozen_string_literal: true

# == Schema Information
#
# Table name: expenses
#
#  id         :bigint           not null, primary key
#  category   :string
#  currency   :string
#  expense    :decimal(, )
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :integer
#
class Expense < ApplicationRecord
  belongs_to :group
  has_many :liabilities, dependent: :destroy

  validates_presence_of :category, :expense, :group_id, :name, :currency
end
