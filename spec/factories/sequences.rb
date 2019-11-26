FactoryBot.define do
  sequence :email do |n|
    "user_#{n}@example.com"
  end

  sequence :username do |n|
    "User_#{n}"
  end

  sequence :password do |n|
    "qwerty#{n}"
  end

  sequence :title do |n|
    "Problem no. #{n}"
  end
end
