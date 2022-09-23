require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:group) { create(:group) }
  let(:expense) { build(:expense, group: group) }

  it 'is valid with valid attributes' do
    expect(expense).to be_valid
  end

  context 'it checks if all the attributes are present' do
    it 'checks if category is present' do
        expense.category = nil
        expect(expense).to_not be_valid
    end

    it 'checks if expense is present' do
        expense.expense = nil
        expect(expense).to_not be_valid
    end

    it 'checks if a group is assosciated with an expense' do
        expense.group = nil
        expect(expense).to_not be_valid
    end

    it 'checks if expense has a name' do
        expense.name = nil
        expect(expense).to_not be_valid
    end

    it 'checks if there is a currency' do
        expense.currency = nil
        expect(expense).to_not be_valid
    end
  end
end