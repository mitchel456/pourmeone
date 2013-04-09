# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :venue do
    source_id "123456"
    source "google"
    name "The Bar"
    address "123 Main St"
    city "San Francisco"
    state "CA"
    zip "94118"
  end
end
