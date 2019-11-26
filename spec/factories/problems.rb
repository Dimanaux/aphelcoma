FactoryBot.define do
  factory :problem do
    title { generate(:title) }
    description { FFaker::Lorem.phrase }
    association :user, factory: :user
  end
end
