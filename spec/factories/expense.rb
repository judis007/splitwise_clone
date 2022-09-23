categories = %w[Rent Transportation Groceries Food Education Health]

FactoryBot.define do 
  factory :expense do
    category { categories.sample }
    expense { Faker::Number.number }
    group_id { Faker::Number.number }
    name { Faker::Name.name  }
    currency { Faker::Currency.code }
  end
end