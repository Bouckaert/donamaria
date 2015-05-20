FactoryGirl.define do

  factory :promissory do
    association :proposal
    association :user
    installment { Faker::Number.digit }
    amount { Faker::Number.decimal(2) }
    expiration_day { Faker::Number.digit }
  end

  factory :invalid_promissory, parent: :promissory do |f|
    f.amount nil
  end

end
