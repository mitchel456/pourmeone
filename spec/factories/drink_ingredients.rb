# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :drink_ingredient do
    drink_id 1
    ingredient_id 1
    raw_text "1 oz Gin"
    after(:create) do |drink_ingredient|
      drink_ingredient.ingredient_id = create(:ingredient).id
    end
  end
end
