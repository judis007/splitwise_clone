# frozen_string_literal: true

module ExpensesHelper
  def currency_codes
    currencies = []
    Money::Currency.table.each_value do |currency|
      currencies += [["#{currency[:name]} (#{currency[:iso_code]})", currency[:iso_code]]]
    end
    currencies
  end
end
