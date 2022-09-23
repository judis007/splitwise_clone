require 'rails_helper'

RSpec.describe Liability, type: :model do
  let(:user) { create(:user) }
  let(:group) { create(:group) }
  let(:expense) { create(:expense, group: group) }
  let(:liability) { build(:liability, user: user, expense: expense) }

  it 'is valid with valid attributes' do
    expect(liability).to be_valid
  end

  context 'checking the presence of each attribute' do
    it 'is not valid without a name' do
        liability.name = nil
        expect(liability).to_not be_valid
    end

    it 'is not valid without a user_id' do
        liability.user_id = nil
        expect(liability).to_not be_valid
    end

    it 'is not valid without an expense id' do
        liability.expense_id = nil
        expect(liability).to_not be_valid
    end

    it 'is not valid without an amount' do 
        liability.amount = nil
        expect(liability).to_not be_valid
    end 
  end
end