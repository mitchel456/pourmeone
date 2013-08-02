# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :drink do

    name 'Some Drink'

    factory :martini do
      name 'Martini'
      after(:build) do |drink|
        drink.ingredients << build(:ingredient, name: 'Gin')
      end
    end

    factory :whiskey_sour do
      name 'Whiskey Sour'
      after(:build) do |drink|
        drink.ingredients << build(:ingredient, name: 'Bourbon')
        drink.ingredients << build(:ingredient, name: 'Lemon Juice')
      end
    end

    factory :manhattan do
      name 'Manhattan'
      after(:build) do |drink|
        drink.ingredients << build(:ingredient, name: 'Whiskey')
        drink.ingredients << build(:ingredient, name: 'Vermouth')
      end
    end
  end
end
