# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@test.com"}
    password "abc123def"
    admin false
  end
end
