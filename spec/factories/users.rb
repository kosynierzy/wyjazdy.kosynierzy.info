# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "user#{n}" }
    email { "#{username.downcase}@example.com" }
    password "password"
    password_confirmation { password }
    confirmed_at { 1.day.ago }
  end
end
