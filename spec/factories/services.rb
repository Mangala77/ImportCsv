FactoryGirl.define do
  factory :service do
    name { Faker::Lorem.word }
    price { Faker::Number.number(5) }
    duration { Faker::Number.number(5) }
    company_id {Faker::Number.number(5)}
  end
end