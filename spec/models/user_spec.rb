require 'rails_helper'

RSpec.describe User, :type => :model do

  it "is not valid without an email" do
    user2 = build(:user, email: nil)
    expect(user2).to_not be_valid
  end

  it "is not valid without a password" do
    user2 = build(:user, password: nil)
    expect(user2).to_not be_valid
  end

  it "is not valid without a first_name" do
    user2 = build(:user, first_name: nil)
    expect(user2).to_not be_valid
  end

  it "is not valid without a last_name" do
    user2 = build(:user, last_name: nil)
    expect(user2).to_not be_valid
  end

end
