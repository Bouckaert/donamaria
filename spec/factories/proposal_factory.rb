FactoryGirl.define do
  factory :proposal do
    association :representative
    title { Faker::Name.title }
    description { Faker::Lorem.paragraph }
  end
end
