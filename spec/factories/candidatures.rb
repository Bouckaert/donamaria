FactoryGirl.define do
  factory :candidature do
    election_year Time.now.year
    association :candidate
  end
end
