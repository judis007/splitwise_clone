# frozen_string_literal: true

require 'csv'

class GenerateBillJob < ApplicationJob
  queue_as :default

  def perform(expense_id)
    liabilities = Liability.where(expense_id: expense_id)
    column_names = %w[user liability_type amount liable_to]
    CSV.generate do |csv|
      csv << column_names
      liabilities.each do |liability|
        if liability.liable_to.nil?
          next
        else
          csv << [User.find(liability.user_id)&.name, liability.name, liability.amount,
                  User.find(liability.liable_to)&.name]
        end
      end
    end
  end
end
