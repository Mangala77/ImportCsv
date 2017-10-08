FactoryGirl.define do
  factory :service do
    name { Faker::Lorem.word }
    price { Faker::Number.number(10) }
    duration { Faker::Number.number(10) }
    company_id 1
  end
end