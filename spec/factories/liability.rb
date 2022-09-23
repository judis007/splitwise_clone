liability_name = [0, 1]

FactoryBot.define do
  factory :liability do 
    name { liability_name.sample }
    user_id { Faker::Number.number }
    expense_id { Faker::Number.number }
    amount { Faker::Number.number }
    liable_to { Faker::Number.number }
  end
end