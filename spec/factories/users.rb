FactoryBot.define do
  factory :user do
    email { generate(:email) }
    username { generate(:username) }
    password { generate(:password) }
    password_confirmation { password }
  end
end
