# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ingredient do
    sequence(:name) {|n| "Gin#{n}" }
    parent_ingredient nil
    description "A delicious ingredient"
    approved true
    submitted_by nil
  end
end
