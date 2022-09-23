FactoryBot.define do 
  factory :expense do
    category { }
    expense { Faker::Number.number }
    group_id { Faker::Number.number }
    name { Faker::Name.name  }
    currency { Faker::Currency.code }
  end
end