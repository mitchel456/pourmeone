require 'spec_helper'

describe Venue do
  
  it "has a valid factory" do
  expect(create(:venue)).to be_valid
    end

  it "is invalid without a source_id" do
    expect(build(:venue, source_id: nil)).to be_invalid
  end

  it "is invalid without a source" do
    expect(build(:venue, source: nil)).to be_invalid
  end

  it "is invalid without a name" do
    expect(build(:venue, name: nil)).to be_invalid
  end

end
