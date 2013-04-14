require 'spec_helper'

describe User do

  it "has a valid factory" do
    create(:user).should be_valid
  end

  it "is invalid without an email" do
    build(:user, email: nil).should_not be_valid
  end

  it "is invalid without a password" do
    build(:user, password: nil).should_not be_valid
  end

  it "is not an admin by default" do
    user = create(:user)
    expect(user).to_not be_admin
  end

  it "can be an admin" do
    user = create(:user, admin: true)
    expect(user).to be_admin
  end

end
