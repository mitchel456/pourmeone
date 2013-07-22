# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :venue do
    name 'The Hotsy Totsy'
    latitude 37.776865
    longitude -122.4585415

    factory :near_venue do
      latitude 37.8
      longitude -122.5
    end

    factory :middle_venue do
      latitude 38.0
      longitude -123.0
    end

    factory :far_venue do
      latitude 40.0
      longitude -124.0
    end

    after(:build) { |venue| venue.class.skip_callback(:validate) }

  end

end
