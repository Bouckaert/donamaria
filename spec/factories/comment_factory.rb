FactoryGirl.define do
  factory :comment do
    association :user
    association :proposal
    body { Faker::Lorem.paragraph }
  end
end
