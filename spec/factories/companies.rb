FactoryGirl.define do
  factory :company do
    name { Faker::Lorem.word }
    disabled false
  end
end