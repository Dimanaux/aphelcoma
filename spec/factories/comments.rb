FactoryBot.define do
  factory :comment do
    text { FFaker::Lorem.phrase }
    association :user, factory: :user
    association :problem, factory: :problem
  end
end
