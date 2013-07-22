require 'spec_helper'

describe Venue do

  it "has a full address" do
    venue = Venue.new(address: '123 Main Street', city: 'Anytown', state: 'CA')
    expect(venue.full_address).to eq '123 Main Street,Anytown,CA'
  end

end
