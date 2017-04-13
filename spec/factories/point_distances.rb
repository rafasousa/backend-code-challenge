FactoryGirl.define do
  factory :point_distance do
    distance { Faker::Number.number(10) }
    origin nil
    destination nil
  end
end