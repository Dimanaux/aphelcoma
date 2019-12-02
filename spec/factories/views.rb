FactoryBot.define do
  factory :view do
    association :user, factory: :user
    association :problem, factory: :problem
  end
end
