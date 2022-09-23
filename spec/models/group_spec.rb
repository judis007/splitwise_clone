require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:group) { build(:group) }

  it 'is valid with valid attributes' do
    expect(group).to be_valid
  end

  it 'checks if group name is present' do
    group.name = nil
    expect(group).to_not be_valid
  end
end