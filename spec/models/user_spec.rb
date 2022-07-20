require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    expect(
      User.new(
        name: 'testing12345',
        email:'test123456@gmaio.com'
      )
    ).to be_valid
  end

  it "is not valid without a name" do
    expect(
      User.new(
        name: nil,
        email: 'test@gmail.com'
      )
    ).to_not be_valid
  end

  it "is not valid without an email" do
    expect(
      User.new(
        name: 'test',
        email: nil
      )
    ).to_not be_valid
  end

  it "is not valid without a unique email" do
    expect(
      User.new(
        name: 'test',
        email: User.first.email
      )
    ).to_not be_valid
  end
end
