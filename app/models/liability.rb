# frozen_string_literal: true

# == Schema Information
#
# Table name: liabilities
#
#  id         :bigint           not null, primary key
#  amount     :decimal(, )
#  liable_to  :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  expense_id :integer
#  user_id    :integer
#
class Liability < ApplicationRecord
  belongs_to :expense
  belongs_to :user

  enum name: { debit: 'debit', credit: 'credit' }

  validates_presence_of :name, :user_id, :expense_id, :amount
end
