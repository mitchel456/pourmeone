FactoryGirl.define do
  factory :drink do |f|
    f.name 'Martini'
    f.description 'The classic cocktail'
    f.instructions 'Shaken, not stirred'
    after(:create) do |member|
      member.drink_ingredients << create(:drink_ingredient, drink_id: member.id)
      member.drink_ingredients << create(:drink_ingredient, drink_id: member.id)
    end
  end
end