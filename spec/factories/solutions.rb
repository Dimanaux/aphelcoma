FactoryBot.define do
  factory :solution do
    code { FFaker::Lorem.phrase }
    association :user, factory: :user
    association :problem, factory: :problem
  end
end
