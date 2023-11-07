FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "user#{n}" }
    email { Faker::Internet.email }
    password { 'password' }
    admin { false }

    trait :admin do
      admin { true }
    end
  end
end
