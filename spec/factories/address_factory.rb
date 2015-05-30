FactoryGirl.define do
  factory :address do
    association :user
    street { Faker::Address.street_address }
    complement { Faker::Address.secondary_address }
    district { Faker::Address.city }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip_code { Faker::Address.zip_code }
  end
end
