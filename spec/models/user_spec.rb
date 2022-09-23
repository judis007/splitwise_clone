# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it "is valid with valid attributes" do
    expect(user).to be_valid
  end

  context "checking the presence of each attribute" do
    it "is not valid without a first_name" do
      user.name = nil
      expect(user).to_not be_valid
    end

    it "is not valid without an email" do
      user.email = nil
      expect(user).to_not be_valid
    end

    it "is not valid without a password" do
      user.password = nil
      expect(user).to_not be_valid
    end
  end

  context "checking the length validations" do

    it "is not valid if the password length is below 6 characters" do
      user.password = "j" * 5
      expect(user).to_not be_valid
    end

    it "is valid if the password length is 6 characters or above" do
      user.password = "j" * 6
      expect(user).to be_valid
      user.password = "j" * 7
      expect(user).to be_valid
    end
  end

  context "email validations" do
    it "is valid if it is a valid email" do
      user.email = "judis@gmail.com"
      expect(user).to be_valid
    end

    it "is not valid if email is invalid" do
      user.email = "judis@com"
      expect(user).to_not be_valid
    end
  end
end
