FactoryGirl.define do
  factory :point do
    name { Faker::Lorem.word }
  end
end