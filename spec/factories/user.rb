# frozen_string_literal: true

FactoryBot.define do
    factory :user do
      name { Faker::Name.first_name }
      email { Faker::Internet.safe_email }
      password { Faker::Internet.password }
    end
  end
  