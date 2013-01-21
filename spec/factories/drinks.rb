FactoryGirl.define do
	factory :drink do |f|
		f.name 'Martini'
		f.description 'The classic cocktail'
		f.instructions 'Shaken, not stirred'
		after(:build) do |member|
			member.ingredients << FactoryGirl.build(:ingredient, name: 'Gin')
			member.ingredients << FactoryGirl.build(:ingredient, name: 'Vermouth')
		end
	end
end