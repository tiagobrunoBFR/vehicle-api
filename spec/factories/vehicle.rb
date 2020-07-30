FactoryBot.define do
  factory :vehicle do
     brand {Faker::Name.name}
     vehicle {Faker::Boolean.boolean}
     year {2020}
     sold {Faker::Boolean.boolean}
     description {Faker::Name.name}
  end
end